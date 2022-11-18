document.querySelector('#info').addEventListener('click', searchByName);
const ItemContainer = document.querySelector("#ItemContainer");
//const id = sessionStorage.getItem('\${MemberNo}');

function searchByName() {
	         ItemContainer.innerHTML =' ';
	const url = './getOneMem';
	fetch(url)
		.then(res => res.json())
		.then(memVO => {

			ItemContainer.insertAdjacentHTML('beforeend', `<div class="content">
			<table>
        <tr>
            <td>會員編號 :${memVO.memberNo}</td><br>
        </tr>
        <tr>
            <td>會員密碼 :${memVO.memberPassword}</td><br>

        </tr>
        <tr>
            <td>會員姓名 :${memVO.memberName}</td><br>

        </tr>
        <tr>
            <td>會員電話 :${memVO.memberPhone}</td><br>

        </tr>
        <tr>
            <td>會員暱稱 :${memVO.memberNickname}</td><br>

        </tr>
        <tr>
            <td>會員地址 :${memVO.memberAddress}</td><br>

        </tr>
        <tr>
            <td>會員e-mail :${memVO.memberEmail}</td><br>
        </tr>
    </table>															
							</div>`




			);
		});
} 