;(function($) {
  $.fn.convertToCY = function() {
    return this.each(function() {
      this.innerHTML = this.innerHTML.replace(/，/g, '\n');
      this.innerHTML = this.innerHTML.replace(/[。|！|？]/g, '\n\n');
      if(this.tagName === 'TEXTAREA') {
        this.value = this.value.replace(/，/g, '\n');
        this.value = this.value.replace(/[。|！|？]/g, '\n\n');
      }
    });
  };
  $.fn.convertFromCY = function() {
    return this.each(function() {
      this.innerHTML = this.innerHTML.replace(/(說)\n/g, function(text, word) {
        return word+  '：\n';
      });
      this.innerHTML = this.innerHTML.replace(/(！|？|：|。|，|、|!|:)\n+/g, function(text, symbol){
        return symbol;
      });
      this.innerHTML = this.innerHTML.replace(/\n\n/g, '。');
      this.innerHTML = this.innerHTML.replace(/\n/g, '，');
      if(!this.innerHTML.match(/[！|？|。]$/)) {
        this.innerHTML += '。';
      }
    });
  };
})(jQuery);