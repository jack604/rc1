"use strict";define("bundles/programming/api/filesSubmissions",["require","exports","module","underscore","pages/open-course/common/naptimeItemClient"],function(require,exports,module){var _=require("underscore"),e=require("pages/open-course/common/naptimeItemClient");exports.submit=function(r){var o={gradedProgramming:"onDemandProgrammingGradedFilesSubmissions.v1",ungradedProgramming:"onDemandProgrammingUngradedFilesSubmissions.v1"},n=r.itemMetadata.getTypeName(),i=o[n];if(!i)throw new Error("I do not know the name of the filesSubmissions resource for "+n);var m=new e(r.itemMetadata),s=_(r).pick("courseId","itemId","verifiableId","versionId"),a={},t=!0;return m.create(i,s,a,t)}});