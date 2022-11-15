document.querySelector('#info').addEventListener('click', searchByName);
	
	function searchByName(){
        const cardWrapper = document.querySelector("#cardWrapper");
		
        const id = sessionStorage.getItem('\${MemberNo}');
//         cardWrapper.innerHTML =' ';
        const url = './getOneMem?MemberNo=' + id;
        fetch(url)
        .then(res => res.json())
        .then(memVO => {	
	
            cardWrapper.insertAdjacentHTML('beforeend',`<div class="content">
            					會員編號 :${memVO.memberNo}<br>
								會員密碼 :${memVO.memberPassword}<br>
								會員姓名 :${memVO.memberName}<br>
								會員電話 :${memVO.memberPhone}<br>
								會員暱稱 :${memVO.memberNickname}<br>
								會員地址 :${memVO.memberAddress}<br>
								會員e-mail :${memVO.memberEmail}<br>																
							</div>`
            		
            																	
						
						
            );
        });
      } 