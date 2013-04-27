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
(function(e){function t(t,n,s,u){var o={dataType:"json"};return 1===arguments.length&&"string"!=typeof arguments[0]?(o=e.extend(o,t),"url"in o&&"data"in o&&(o.url=r(o.url,o.data))):(e.isFunction(n)&&(u=s,s=n,n=null),t=r(t,n),o=e.extend(o,{url:t,data:n,success:function(e,t,r){s&&s.call(o.context||o,e,a(r),r)},error:function(e){u&&u.call(o.context||o,e,a(e))}})),o}function r(e,t){var r,a,n;for(r in t)n=t[r],a=e.replace("{"+r+"}",n),a!=e&&(e=a,delete t[r]);return e}function a(t){var r={},a=e.trim(t.getAllResponseHeaders());return e.each(a.split("\n"),function(t,a){if(a.length){var n=a.match(/^([\w\-]+):(.*)/);3===n.length&&(r[n[1]]=e.trim(n[2]))}}),t.responseHeaders=r,r}var n=e.ajax;e.restSetup={methodParam:"_method",useMethodOverride:!1,verbs:{create:"POST",update:"PUT",destroy:"DELETE"}},e(document).ready(function(){e.restSetup.csrfParam=e.restSetup.csrfParam||e("meta[name=csrf-param]").attr("content"),e.restSetup.csrfToken=e.restSetup.csrfToken||e("meta[name=csrf-token]").attr("content")}),e.ajax=function(t){var r,a=new RegExp("("+e.restSetup.csrfParam+"=)","i"),s=t.beforeSend;return"string"!=typeof t.data&&null!=t.data&&(t.data=e.param(t.data)),t.data=t.data||"",e.restSetup.csrfParam&&e.restSetup.csrfToken&&(/^(get)$/i.test(t.type)||a.test(t.data)||(t.data+=(t.data?"&":"")+e.restSetup.csrfParam+"="+e.restSetup.csrfToken)),e.restSetup.useMethodOverride&&(/^(get|post)$/i.test(t.type)||(r=t.type.toUpperCase(),t.data+=(t.data?"&":"")+e.restSetup.methodParam+"="+t.type.toLowerCase(),t.type="POST")),t.beforeSend=function(a,n){var u=t.context||t,o=t.contentType,p=/.*\.(json|xml)/i.exec(t.url);o||(o=e.restSetup.contentType),!o&&p&&(o="application/"+p[1].toLowerCase()),t.contentType!=o&&e.extend(t,{contentType:o}),r&&a.setRequestHeader("X-HTTP-Method-Override",r),e.isFunction(s)&&s.call(u,a,n)},n.call(this,t)},e.read=function(){var r=t.apply(this,arguments);return r.type="GET",e.ajax(r)},e.create=function(){var r=t.apply(this,arguments);return r.type=e.restSetup.verbs.create,e.ajax(r)},e.update=function(){var r=t.apply(this,arguments);return r.type=e.restSetup.verbs.update,e.ajax(r)},e.destroy=function(){var r=t.apply(this,arguments);return r.type=e.restSetup.verbs.destroy,e.ajax(r)}})(jQuery);