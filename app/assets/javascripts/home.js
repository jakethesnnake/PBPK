document.addEventListener('click', function(event){
    if(event.target.classList.contains('radio-button-btn')) {
        document.querySelector('#submitMyForm').click();
    }
});