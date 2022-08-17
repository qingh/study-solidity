// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/* 
状态说明
    众筹成功 	众筹金额大于等于期望的金额，系统自动结束该项目
    众筹失败	1、筹款人提前停止众筹项目
                2、超时还未筹集到期望金额，系统自动结束项目
 */
contract CrowdfundingContract {
    uint No;
    struct Crowdfunding {
        uint num;           //项目编号
        string title;       //项目标题
        uint status;        //状态 0:所有众筹; 1:众筹中；2:众筹成功；3:众筹失败；4:我的众筹项目
        address creator;    //发起人
        address recipient;  //收款人
        uint joinNum;       //参与人数
        uint expectAmout;   //期望众筹金额
        uint actualAmount;  //实际众筹金额
    }

    Crowdfunding[] public list;
    mapping(uint => Crowdfunding[]) filterDataByStatus;
    mapping(address => Crowdfunding[]) myCrowdfunding;
    mapping(uint => address[]) calcJoinNum;//项目编号映射参与人的地址，以此计算参与人数，多次众筹只计一人

    event Log(string a,address msg);

    function stringToInt(string memory s) public pure returns (uint){
        bytes memory b = bytes(s);
        uint result = 0;
        for (uint256 i = 0; i < b.length; i++) {
            uint256 c = uint256(uint8(b[i]));
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
        return result;
    }

    function createCrowdfunding(string memory _title,address _recipient, uint _expectAmout) public {
        No++;
        Crowdfunding memory c = Crowdfunding({
            num: No,
            title:_title,
            status: 1,
            creator: msg.sender,
            recipient: _recipient,
            joinNum: 0,       
            expectAmout: _expectAmout,
            actualAmount: 0
        });
        list.push(c);
        // filterDataByStatus[0].push(c); filterDataByStatus[0] === list
        filterDataByStatus[1].push(c);
        myCrowdfunding[msg.sender].push(c);
    }

    /* 通过编号修改状态，只能从进行中=>众筹失败 */
    function setStatus(uint num) public {
        list[num-1].status = 3;
        //进行中 delete + pop
        //众筹失败 push
        if(filterDataByStatus[1].length == 1){
            filterDataByStatus[1].pop();
        }else{
            for(uint i = 0; i < filterDataByStatus[1].length - 1; i++) {
                if(filterDataByStatus[1][i].num == num) {
                    filterDataByStatus[1][i] = filterDataByStatus[1][i+1];
                }
            }
            filterDataByStatus[1].pop();
        }
        filterDataByStatus[3].push(list[num-1]);
    }

    /* 通过编号修改标题，只能修改状态为众筹中的项 */
    function setTitle(uint num,string memory title) public {
        list[num-1].title = title;
    }

    /* 参与众筹，addr是参与人的地址 */
    function join(uint num,uint amount,address addr) public {
        //禁止给自己众筹
        require(list[num-1].recipient != addr,"\u4e0d\u80fd\u7ed9\u81ea\u5df1\u6350\u6b3e");

        bool isFirstJoin = true;
        uint len = calcJoinNum[num-1].length;
        if(len == 0) {
            list[num-1].joinNum += 1;
            calcJoinNum[num-1].push(addr);
        } else {
            for(uint i = 0; i < len;i++) {
                if(calcJoinNum[num-1][i] == addr) {
                    isFirstJoin = false;
                    break;
                }
            }

            if(isFirstJoin) {
                list[num-1].joinNum += 1;
                calcJoinNum[num-1].push(addr);
            }
        }        

        //以下代码是对的
        list[num-1].actualAmount = list[num-1].actualAmount + amount;
        if(list[num-1].actualAmount >= list[num-1].expectAmout){
            //已达到期望的众筹金额，状态变为成功
            list[num-1].status = 2;
        }
         //给收款人打钱 todo
         payable(list[num-1].recipient).transfer(amount);
    }


    /* 通过状态过滤众筹项目 */
    function getCrowdfundingByStatus(uint _status) public view returns (Crowdfunding[] memory) {
        if(_status == 0) return list;
        return filterDataByStatus[_status];
    }

    /* 获取我发起的众筹项目 */
    function getMyCrowdfunding(address addr) public view returns (Crowdfunding[] memory) {
        return myCrowdfunding[addr];
    }
}