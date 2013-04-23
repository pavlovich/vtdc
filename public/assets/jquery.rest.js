/*
 * Copyright (c) 2011 Lyconic, LLC.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
(function(e){function n(t,n,s,o){var u={dataType:"json"};return arguments.length===1&&typeof arguments[0]!="string"?(u=e.extend(u,t),"url"in u&&"data"in u&&(u.url=r(u.url,u.data))):(e.isFunction(n)&&(o=s,s=n,n=null),t=r(t,n),u=e.extend(u,{url:t,data:n,success:function(e,t,n){s&&s.call(u.context||u,e,i(n),n)},error:function(e){o&&o.call(u.context||u,e,i(e))}})),u}function r(e,t){var n,r,i;for(n in t)i=t[n],r=e.replace("{"+n+"}",i),r!=e&&(e=r,delete t[n]);return e}function i(t){var n={},r=e.trim(t.getAllResponseHeaders());return e.each(r.split("\n"),function(t,r){if(r.length){var i=r.match(/^([\w\-]+):(.*)/);i.length===3&&(n[i[1]]=e.trim(i[2]))}}),t.responseHeaders=n,n}var t=e.ajax;e.restSetup={methodParam:"_method",useMethodOverride:!1,verbs:{create:"POST",update:"PUT",destroy:"DELETE"}},e(document).ready(function(){e.restSetup.csrfParam=e.restSetup.csrfParam||e("meta[name=csrf-param]").attr("content"),e.restSetup.csrfToken=e.restSetup.csrfToken||e("meta[name=csrf-token]").attr("content")}),e.ajax=function(n){var r=new RegExp("("+e.restSetup.csrfParam+"=)","i"),i=n.beforeSend,s;return typeof n.data!="string"&&n.data!=null&&(n.data=e.param(n.data)),n.data=n.data||"",e.restSetup.csrfParam&&e.restSetup.csrfToken&&(/^(get)$/i.test(n.type)||r.test(n.data)||(n.data+=(n.data?"&":"")+e.restSetup.csrfParam+"="+e.restSetup.csrfToken)),e.restSetup.useMethodOverride&&(/^(get|post)$/i.test(n.type)||(s=n.type.toUpperCase(),n.data+=(n.data?"&":"")+e.restSetup.methodParam+"="+n.type.toLowerCase(),n.type="POST")),n.beforeSend=function(t,r){var o=n.context||n,u=n.contentType,a=/.*\.(json|xml)/i.exec(n.url);u||(u=e.restSetup.contentType),!u&&a&&(u="application/"+a[1].toLowerCase()),n.contentType!=u&&e.extend(n,{contentType:u}),s&&t.setRequestHeader("X-HTTP-Method-Override",s),e.isFunction(i)&&i.call(o,t,r)},t.call(this,n)},e.read=function(){var t=n.apply(this,arguments);return t.type="GET",e.ajax(t)},e.create=function(){var t=n.apply(this,arguments);return t.type=e.restSetup.verbs.create,e.ajax(t)},e.update=function(){var t=n.apply(this,arguments);return t.type=e.restSetup.verbs.update,e.ajax(t)},e.destroy=function(){var t=n.apply(this,arguments);return t.type=e.restSetup.verbs.destroy,e.ajax(t)}})(jQuery);