"use strict";define("bundles/programming/components/Footer",["require","exports","module","react-with-addons","bundles/content-feedback/components/ItemFeedback","bundles/content-feedback/constants/ItemTypes","pages/open-course/common/constants"],function(require,exports,module){var e=require("react-with-addons"),t=require("bundles/content-feedback/components/ItemFeedback"),o=require("bundles/content-feedback/constants/ItemTypes"),n=require("pages/open-course/common/constants"),a=e.createClass({displayName:"Footer",propTypes:{itemMetadata:e.PropTypes.object.isRequired},render:function render(){if(!t.shouldShow()||"programming"===this.props.itemMetadata.getTypeName())return null;return e.createElement("div",{className:"fixed-bottom-bar"},e.createElement(t,{itemType:o.Programming,courseId:n.courseId,itemMetadata:this.props.itemMetadata,itemId:this.props.itemMetadata.getId(),tooltipPlacement:"right"}))}});module.exports=a});