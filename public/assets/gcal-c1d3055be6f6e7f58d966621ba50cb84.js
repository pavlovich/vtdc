/*
 * FullCalendar v1.5.1 Google Calendar Plugin
 *
 * Copyright (c) 2011 Adam Shaw
 * Dual licensed under the MIT and GPL licenses, located in
 * MIT-LICENSE.txt and GPL-LICENSE.txt respectively.
 *
 * Date: Sat Apr 9 14:09:51 2011 -0700
 *
 */
!function(e){function t(t,a,i){var d=t.success,s=e.extend({},t.data||{},{"start-min":r(a,"u"),"start-max":r(i,"u"),singleevents:!0,"max-results":9999}),u=t.currentTimezone;return u&&(s.ctz=u=u.replace(" ","_")),e.extend({},t,{url:t.url.replace(/\/basic$/,"/full")+"?alt=json-in-script&callback=?",dataType:"jsonp",data:s,startParam:!1,endParam:!1,success:function(t){var a=[];t.feed.entry&&e.each(t.feed.entry,function(t,r){var c,i=r.gd$when[0].startTime,d=n(i,!0),s=n(r.gd$when[0].endTime,!0),o=-1==i.indexOf("T");e.each(r.link,function(e,t){"text/html"==t.type&&(c=t.href,u&&(c+=(-1==c.indexOf("?")?"?":"&")+"ctz="+u))}),o&&l(s,-1),a.push({id:r.gCal$uid.value,title:r.title.$t,url:c,start:d,end:s,allDay:o,location:r.gd$where[0].valueString,description:r.content.$t})});var r=[a].concat(Array.prototype.slice.call(arguments,1)),i=c(d,this,r);return e.isArray(i)?i:a}})}var a=e.fullCalendar,r=a.formatDate,n=a.parseISO8601,l=a.addDays,c=a.applyAll;a.sourceNormalizers.push(function(e){("gcal"==e.dataType||void 0===e.dataType&&(e.url||"").match(/^(http|https):\/\/www.google.com\/calendar\/feeds\//))&&(e.dataType="gcal",void 0===e.editable&&(e.editable=!1))}),a.sourceFetchers.push(function(e,a,r){return"gcal"==e.dataType?t(e,a,r):void 0}),a.gcalFeed=function(t,a){return e.extend({},a,{url:t,dataType:"gcal"})}}(jQuery);