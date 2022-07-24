jQuery(document).ready(function() {
  // jQuery('#wp-admin-bar-nc-handled-errors-loading').attr('id', wp_admin_bar_id);
  // jQuery('#'+wp_admin_bar_id).find('a').html(wp_admin_bar_title);
  // jQuery('#'+wp_admin_bar_id).find('a').attr('title', wp_admin_bar_meta_title);
  // jQuery('#wp-admin-bar-nc-handled-errors, #wp-admin-bar-nc-handled-warnings, #wp-admin-bar-nc-handled-parses, #wp-admin-bar-nc-handled-notices, #wp-admin-bar-nc-handled-nones' ).find('a').click(function() {
  jQuery('#nc-debug-opener a').click(function() {
    jQuery('.thickbox.nc-error-popin-thickbox-launcher').click();
    jQuery('#nc_debug_content').appendTo(jQuery('#TB_ajaxContent'));
    return false;
  });
  // });
});
