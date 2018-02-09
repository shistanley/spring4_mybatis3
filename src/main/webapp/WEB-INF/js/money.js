/*投资本金仅能输入数字和小数点*/
var precapital;
document.querySelector('.capital').addEventListener('focus', function() {
	if (this.value == '0.00') {
		this.value = '';
	} else {
		this.value = this.value.replace(/\.00/, '').replace(/(\.\d)0/, '$1');
	}
	precapital = this.value;
});
document.querySelector('.capital').addEventListener('keyup', function() {

	this.value = this.value.replace(/^[\.]/, '').replace(/[^\d.]/g, '');
	if (this.value.split(".").length - 1 > 1) {
		this.value = precapital;
	}
	precapital = this.value;
});
document.querySelector('.capital').addEventListener(
		'blur',
		function() {
			this.value = this.value.replace(/[\.]$/, '');
			this.value = this.value.replace(/(.*)\.([\d]{2})(\d*)/g, '$1.$2');
			this.value = Number(this.value).toFixed(2);
			var logNum = this.value.toString();
			if (logNum.match(/\./g) != null) {
				integerNum = parseInt(logNum).toString().replace(
						/\d(?=(\d{3})+$)/g, '$&,');
				decimalNum = '.' + logNum.replace(/(.*)\.(.*)/g, '$2');
				document.querySelector(".logbox").innerHTML = integerNum
						+ decimalNum;
			} else {
				document.querySelector(".logbox").innerHTML = logNum.replace(
						/\d(?=(\d{3})+$)/g, '$&,');
			}
		});