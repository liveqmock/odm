Observer = function(){
    function getResultFn(name, fn){
        return function(){
            console.log("正在执行的函数：" + name);
            console.log('该函数的参数列表：');
            for (var i = 0; i < arguments.length; i++) {
                console.log(arguments[i]);
            }
            var res = fn.apply(this, arguments);
            if (res) {
                console.log('该函数运行结果：');
                console.log(res);
            }
            return res;
        }
    }
    return {
        /**
         *
         * @param {Object} clazz 对象
         * @param {Object} name 对象属性名称（该属性必须为函数）
         * @param {Object} isPrototype 该属性是否原型属性
         */
        check: function(clazz, name, isPrototype){
            var p = (isPrototype === true) ? clazz.prototype : clazz;
            if (!p[name] || typeof p[name] != 'function') {
                console.log('This protperty is not exist or it is not a function!');
                return;
            }
            p[name] = getResultFn(name, p[name]);
        }
    }
}();

Observer.check(Ext.form.ComboBox, 'render', true);
