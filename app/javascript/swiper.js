$(function () {
  new Swiper('.swiper', {
    effect: 'flip',
    grabCursor: true,
    pagination: {
      el: '.swiper-pagination',
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  })
});


