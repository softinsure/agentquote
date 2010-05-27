/*
 * Custom js function for application page
*/
window.onbeforeunload= function(){ 
    return 'There may be some unsaved changes on this page.\n\nLeave Anyway?'; 
};
window.onload= function(){ 
	 //window.document.addressbar.enabled=false;
};