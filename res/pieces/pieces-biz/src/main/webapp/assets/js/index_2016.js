// slide
!(function($){
	$.easing.easeInOutExpo = function (x, t, b, c, d) {
		if (t==0) return b;
		if (t==d) return b+c;
		if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
		return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
	}

	var defaults = {
		speed: 700,
		delay: 5e3,
		idx: 0,
		easing: 'swing',
		autoPlay: true
	}

	// Carousel
	function Carousel(elem, options) {
		this.settings = $.extend({}, defaults, options);
		this.idx      = this.settings.idx;
		this.$elem    = $(elem);
		this.length   = this.$elem.find('.bd li').length;
		this.length > 1 && this.init();
	}
	Carousel.prototype = {
		init: function() {
			this.createNav();
			this.$slide = this.$elem.find('.bd ul');
			this.$items = this.$slide.find('li');
			this.$nav = this.$elem.find('.hd i');
			this.setCss();
			this.bindEvent();
			this.autoPlay();
		},
		createNav: function() {
			var modal = [];
			var i = 0;
			for (; i < this.length; i++) {
				modal.push('<i', (this.idx === i ? ' class="current"' : '') ,'></i>');
			}
			if (this.$elem.find('.hd').length === 0) {
				this.$elem.append('<div class="hd">' + modal.join('') + '</div>');
			} else {
				this.$elem.find('.hd').html(modal.join(''));	
			}
		},
		doPlay: function() {
			var self = this;
			self.$nav.eq(self.idx).addClass('current').siblings().removeClass('current');
			self.$slide.stop().animate({'left': -self.idx + '00%'}, self.settings.speed, self.settings.easing);
		},
		autoPlay: function() {
			var self = this;
			if (self.settings.autoPlay !== true) {
				return;
			}
			this.timer && clearInterval(this.timer);
			this.timer = setInterval(function() {
				self.idx = self.idx === self.length - 1 ? 0 : self.idx + 1;
				self.doPlay();
			}, self.settings.delay);
		},
		bindEvent: function() {
			var self = this;
			self.$nav.on('click', function() {
				self.idx = $(this).index();
				self.doPlay();
				self.autoPlay();
			})
		},
		setCss: function() {
			this.$slide.css({'width': this.length + '00%', 'position':'absolute', 'left':'0', 'top':'0'});
			this.$items.css({'float':'left', 'width': (100 / this.length) + '%'});
		}
	}
	$.fn.carousel = function(options) {
		return this.each(function() {
			new Carousel(this, options);
		});
	}

	// Slide
	function Slide(elem, options) {
		this.settings = $.extend({}, defaults, options);
		this.idx      = this.settings.idx;
		this.$elem    = $(elem);
		this.width    = this.$elem.width();
		this.length   = this.$elem.find('.col').length;
		this.init();
	}
	Slide.prototype = {
		init: function() {
			this.$items = this.$elem.find('.col');
			this.$prev = this.$elem.find('.prev');
			this.$next = this.$elem.find('.next');
			this.setCss();
			if (this.length < 2) {
				this.$prev.addClass('disabled');
				this.$next.addClass('disabled');
			} else {
				this.bindEvent();
				this.autoPlay();
			}
		},
		doPlay: function(step) {
			var self = this;
			self.$items.eq(self.idx).stop().animate({'left': -1 * step * self.width}, self.settings.speed, function(){
				$(this).removeClass('current');
			});

			if (step === -1) {
				self.idx = self.idx === 0 ? self.length - 1 : self.idx - 1;
			} else {
				self.idx = self.idx === self.length - 1 ? 0 : self.idx + 1;
			}

			self.$items.eq(self.idx).stop().addClass('current').css({'left':step * self.width}).animate({'left':0}, self.settings.speed);
			self.autoPlay();
		},
		autoPlay: function() {
			var self = this;
			if (self.settings.autoPlay !== true) {
				return;
			}
			this.timer && clearInterval(this.timer);
			this.timer = setInterval(function() {
				self.$next.trigger('click');
			}, self.settings.delay);
		},
		bindEvent: function() {
			var self = this;
			self.$prev.on('click', function() {
				self.doPlay(-1);
			})
			self.$next.on('click', function() {
				self.doPlay(1);
			})
		},
		setCss: function() {
			this.$items.eq(0).addClass('current');
		}
	}
	$.fn.slide = function(options) {
		return this.each(function() {
			new Slide(this, options);
		});
	}

})(jQuery);

$(function(){
	// 返回页面顶部
	window.scrollTo(0, 0);

	var EASING = 'easeInOutExpo';
	$('#jslide').carousel({
		easing: EASING
	});
	$('#jbrands').slide({
		// autoPlay: false,
		speed: 300
	});

	// 楼层导航
	var 
		$win      = $(window),
		$gotop 	  = $('#jgotop'),
		$elevator = $('#jelevator'),
		threshold = $('.idx-main').offset().top,
		elevator  = function() {
			var stop  = $win.scrollTop();
			$elevator[stop < threshold ? 'fadeOut' : 'fadeIn'](100);
			$gotop[stop < threshold ? 'fadeOut' : 'fadeIn'](100);
		},
		_elevator = throttle(elevator, 50, 150);

	var html = ['<ul>'];
	$('.idx-floor').each(function() {
		var text = $(this).find('.idx-hd h2').html().replace('类', '');
		var className = text.length > 3 ? ' class="mul"' : '';
		html.push('<li><a href="#', this.id, '"', className, '>', text, '</a></li>');
	});
	html.push('</ul>');

	elevator();
	$win.on('scroll.elevator', _elevator);
	$elevator.html(html.join('')).onePageNav();
	$gotop.on('click', function() {
		$('html, body').animate({
			scrollTop: 0
		}, 700, EASING);
	});
});