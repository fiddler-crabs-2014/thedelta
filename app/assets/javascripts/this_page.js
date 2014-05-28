function this_page(controller, action) {
  return $("#page-identifier").attr("data-controller") === controller && $("#page-identifier").attr("data-action");
};
