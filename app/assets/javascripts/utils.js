var DELTA = DELTA || {};

DELTA.is_page = function(controller, action) {
  if( DELTA.controller_name === undefined) { DELTA.controller_name = $("#page-identifier").attr("data-controller") }
  if( DELTA.action_name === undefined) { DELTA.action_name = $("#page-identifier").attr("data-action") }
  return DELTA.controller_name === controller && DELTA.action_name === action;
};
