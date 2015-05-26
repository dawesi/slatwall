"use strict";
angular.module('slatwalladmin').directive('swPropertyDisplay', ['$log', 'partialsPath', function($log, partialsPath) {
  return {
    require: '^form',
    restrict: 'AE',
    scope: {
      object: "=",
      property: "@",
      editable: "=",
      editing: "=",
      isHidden: "=",
      title: "=",
      hint: "=",
      optionsArguments: "=",
      eagerLoadOptions: "=",
      isDirty: "=",
      onChange: "=",
      fieldType: "@",
      noValidate: "="
    },
    templateUrl: partialsPath + "propertydisplay.html",
    link: function(scope, element, attrs, formController) {
      $log.debug('editingproperty');
      $log.debug(scope.property);
      $log.debug(scope.object);
      scope.propertyDisplay = {
        object: scope.object,
        property: scope.property,
        errors: {},
        editing: scope.editing,
        editable: scope.editable,
        isHidden: scope.isHidden,
        fieldType: scope.fieldType || scope.object.metaData.$$getPropertyFieldType(scope.property),
        title: scope.title,
        hint: scope.hint || scope.object.metaData.$$getPropertyHint(scope.property),
        optionsArguments: scope.optionsArguments || {},
        eagerLoadOptions: scope.eagerLoadOptions || true,
        isDirty: scope.isDirty,
        onChange: scope.onChange,
        noValidate: scope.noValidate
      };
      if (angular.isUndefined(scope.propertyDisplay.noValidate)) {
        scope.propertyDisplay.noValidate = false;
      }
      if (angular.isUndefined(scope.propertyDisplay.editable)) {
        scope.propertyDisplay.editable = true;
      }
      if (angular.isUndefined(scope.editing)) {
        scope.propertyDisplay.editing = false;
      }
      if (angular.isUndefined(scope.propertyDisplay.isHidden)) {
        scope.propertyDisplay.isHidden = false;
      }
      scope.$id = 'propertyDisplay:' + scope.property;
      scope.propertyDisplay.form = formController;
      $log.debug(scope.propertyDisplay);
      $log.debug('propertyDisplay');
      $log.debug(scope.propertyDisplay);
    }
  };
}]);

//# sourceMappingURL=../../directives/common/swpropertydisplay.js.map