function checkLike() {
	let checkWish = $('#likeBtn1').find('.fa-thumbs-up')

	if(checkWish.hasClass('on')) {
		checkWish.css('color', 'blue')
	} else {
		checkWish.css('color', 'lightgray')
	}
}

$('#likeBtn1').click(() => {
    $('#likeBtn1').find('.fa-thumbs-up').toggleClass('on', 'off')
    checkLike()
})