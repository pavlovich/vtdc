function updateEvent(e){$.update("/events/"+e.id,{event:{title:e.title,starts_at:""+e.start,ends_at:""+e.end,description:e.description}},function(){alert("successfully updated task.")})}$(document).ready(function(){var e=new Date;e.getDate(),e.getMonth(),e.getFullYear(),$("#calendar").fullCalendar({editable:!0,header:{left:"prev,next today",center:"title",right:"month,agendaWeek,agendaDay"},defaultView:"month",height:500,slotMinutes:15,loading:function(e){e?$("#loading").show():$("#loading").hide()},eventSources:[{url:"/events",color:"yellow",textColor:"black",ignoreTimezone:!1}],timeFormat:"h:mm t{ - h:mm t} ",dragOpacity:"0.5",eventDrop:function(e){updateEvent(e)},eventResize:function(e){updateEvent(e)},eventClick:function(){}})});