/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("smiley",function(e){for(var t=e.config,n=e.lang.smiley,r=t.smiley_images,i=t.smiley_columns||8,s,o=function(t){var n=t.data.getTarget(),r=n.getName();if("a"==r)n=n.getChild(0);else if("img"!=r)return;var r=n.getAttribute("cke_src"),i=n.getAttribute("title"),n=e.document.createElement("img",{attributes:{src:r,"data-cke-saved-src":r,title:i,alt:i,width:n.$.width,height:n.$.height}});e.insertElement(n),s.hide(),t.data.preventDefault()},u=CKEDITOR.tools.addFunction(function(t,n){var t=new CKEDITOR.dom.event(t),n=new CKEDITOR.dom.element(n),r;r=t.getKeystroke();var i="rtl"==e.lang.dir;switch(r){case 38:if(r=n.getParent().getParent().getPrevious())r=r.getChild([n.getParent().getIndex(),0]),r.focus();t.preventDefault();break;case 40:(r=n.getParent().getParent().getNext())&&(r=r.getChild([n.getParent().getIndex(),0]))&&r.focus(),t.preventDefault();break;case 32:o({data:t}),t.preventDefault();break;case i?37:39:if(r=n.getParent().getNext())r=r.getChild(0),r.focus(),t.preventDefault(!0);else if(r=n.getParent().getParent().getNext())(r=r.getChild([0,0]))&&r.focus(),t.preventDefault(!0);break;case i?39:37:if(r=n.getParent().getPrevious())r=r.getChild(0),r.focus(),t.preventDefault(!0);else if(r=n.getParent().getParent().getPrevious())r=r.getLast().getChild(0),r.focus(),t.preventDefault(!0)}}),a=CKEDITOR.tools.getNextId()+"_smiley_emtions_label",a=['<div><span id="'+a+'" class="cke_voice_label">'+n.options+"</span>",'<table role="listbox" aria-labelledby="'+a+'" style="width:100%;height:100%;border-collapse:separate;" cellspacing="2" cellpadding="2"',CKEDITOR.env.ie&&CKEDITOR.env.quirks?' style="position:absolute;"':"","><tbody>"],f=r.length,n=0;n<f;n++){0===n%i&&a.push('<tr role="presentation">');var l="cke_smile_label_"+n+"_"+CKEDITOR.tools.getNextNumber();a.push('<td class="cke_dark_background cke_centered" style="vertical-align: middle;" role="presentation"><a href="javascript:void(0)" role="option"',' aria-posinset="'+(n+1)+'"',' aria-setsize="'+f+'"',' aria-labelledby="'+l+'"',' class="cke_smile cke_hand" tabindex="-1" onkeydown="CKEDITOR.tools.callFunction( ',u,', event, this );">','<img class="cke_hand" title="',t.smiley_descriptions[n],'" cke_src="',CKEDITOR.tools.htmlEncode(t.smiley_path+r[n]),'" alt="',t.smiley_descriptions[n],'"',' src="',CKEDITOR.tools.htmlEncode(t.smiley_path+r[n]),'"',CKEDITOR.env.ie?" onload=\"this.setAttribute('width', 2); this.removeAttribute('width');\" ":"",'><span id="'+l+'" class="cke_voice_label">'+t.smiley_descriptions[n]+"</span></a>","</td>"),n%i==i-1&&a.push("</tr>")}if(n<i-1){for(;n<i-1;n++)a.push("<td></td>");a.push("</tr>")}return a.push("</tbody></table></div>"),t={type:"html",id:"smileySelector",html:a.join(""),onLoad:function(e){s=e.sender},focus:function(){var e=this;setTimeout(function(){e.getElement().getElementsByTag("a").getItem(0).focus()},0)},onClick:o,style:"width: 100%; border-collapse: separate;"},{title:e.lang.smiley.title,minWidth:270,minHeight:120,contents:[{id:"tab1",label:"",title:"",expand:!0,padding:0,elements:[t]}],buttons:[CKEDITOR.dialog.cancelButton]}});