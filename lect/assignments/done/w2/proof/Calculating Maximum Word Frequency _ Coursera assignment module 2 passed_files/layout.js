"use strict";define("bundles/programming/views/layout",["require","exports","module","moment","underscore","bundles/ondemand/appContextSingleton","bundles/ondemand/stores/CourseScheduleStore","bundles/ondemand/stores/SessionStore","bundles/ondemand/utils/penaltiesExperiment","bundles/phoenix/components/tabbedItemLayout/tabbedItemView","bundles/programming/components/Footer","bundles/programming/components/MetaInfoArea","bundles/programming/views/layoutDeadlines.html","i18n!nls/assess"],function(require,exports,module){var o=require("moment"),_=require("underscore"),r=require("bundles/ondemand/appContextSingleton"),u=require("bundles/ondemand/stores/CourseScheduleStore"),m=require("bundles/ondemand/stores/SessionStore"),s=require("bundles/ondemand/utils/penaltiesExperiment"),t=require("bundles/phoenix/components/tabbedItemLayout/tabbedItemView"),i=require("bundles/programming/components/Footer"),a=require("bundles/programming/components/MetaInfoArea"),d=require("bundles/programming/views/layoutDeadlines.html"),n=require("i18n!nls/assess"),e=function getMetadata(e){return function(){return this.itemMetadata.get(e)}},l=t.extend({multitracker:{namespace:"open_course_item.programming_header",baseValues:["open_course_id","module_id","lesson_id","item_id"],definitions:{open_course_id:e("course.id"),module_id:e("lesson.module.id"),lesson_id:e("lesson.id"),item_id:e("id")},events:{"click.instructions":[]}},leftNavLinkConfigs:function leftNavLinkConfigs(){return[{url:"",subview:"instructions",title:n("Instructions"),event:"click.instructions"},{url:"submission",subview:"submission",title:n("My submission"),event:"click.submission"}]},rightNavLinkConfigs:function rightNavLinkConfigs(){return[{url:"discussions",title:n("Discussions"),event:"click.question_and_answer"}]},bodyClasses:"c-item-peer c-item-programming",initialize:function initialize(e){t.prototype.initialize.call(this,e),_(this).extend(_(e).pick("course","courseProgress","courseGrade","verificationDisplay","itemMetadata","learnerAssignment","subview"))},renderSubviews:function renderSubviews(){this.renderDeadlineArea(),this.renderMetaInfoArea(),this.renderFooter()},renderDeadlineArea:function renderDeadlineArea(){if(m.isEnrolled()){var n=this.itemMetadata.get("lesson.module.id"),t=r.getComponentContext().getStore("CourseScheduleStore"),e=t.getDeadlineForModuleId(n);this.$$("programming-deadline-area").html(d({deadline:u.getFormattedDeadline(e),hasDeadlinePassed:o().isAfter(e),penaltiesEnabled:s()}))}},renderMetaInfoArea:function renderMetaInfoArea(){_(["gradedProgramming","ungradedProgramming"]).contains(this.itemMetadata.getTypeName())&&this.renderReactIntoElement(a,this.$$("meta-info")[0],{itemMetadata:this.itemMetadata,learnerAssignment:this.learnerAssignment,courseProgress:this.courseProgress,courseGrade:this.courseGrade,verificationDisplay:this.verificationDisplay})},renderFooter:function renderFooter(){this.renderReactIntoElement(i,this.$$("item-footer")[0],{itemMetadata:this.itemMetadata})}});module.exports=l});