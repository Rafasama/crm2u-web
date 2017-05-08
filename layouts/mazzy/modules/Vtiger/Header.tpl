{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
<!DOCTYPE html>
<html>
	<head>
		<title>
			{vtranslate($PAGETITLE, $MODULE_NAME)}
		</title>
		<link REL="SHORTCUT ICON" HREF="layouts/vlayout/skins/images/favicon.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0," />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="apple-mobile-web-app-capable" content="yes" />

		<link rel="stylesheet" href="libraries/jquery/chosen/chosen.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="libraries/jquery/jquery-ui/css/custom-theme/jquery-ui-1.8.16.custom.css" type="text/css" media="screen" />

		<link rel="stylesheet" href="libraries/jquery/select2/select2.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="libraries/bootstrap/css/bootstrap.css" type="text/css" media="screen" />
                <link rel="stylesheet" href="libraries/bootstrap/css/jqueryBxslider.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="resources/styles.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="libraries/jquery/posabsolute-jQuery-Validation-Engine/css/validationEngine.jquery.css" />

		<link rel="stylesheet" href="libraries/jquery/select2/select2.css" />

		<link rel="stylesheet" href="libraries/guidersjs/guiders-1.2.6.css"/>
		<link rel="stylesheet" href="libraries/jquery/pnotify/jquery.pnotify.default.css"/>
		<link rel="stylesheet" href="libraries/jquery/pnotify/use for pines style icons/jquery.pnotify.default.icons.css"/>
		<link rel="stylesheet" media="screen" type="text/css" href="libraries/jquery/datepicker/css/datepicker.css" />
		{foreach key=index item=cssModel from=$STYLES}
                    <link rel="{$cssModel->getRel()}" href="{vresource_url($cssModel->getHref())}" type="{$cssModel->getType()}" media="{$cssModel->getMedia()}" />
		{/foreach}
		<link rel="stylesheet" href="layouts/mazzy/skins/mycstyle.css"/>
		
		{* For making pages - print friendly *}
		<style type="text/css">
		@media print {
		.noprint { display:none; }
		.mycloaderbg { display:none; }
		}
		</style>

		{* This is needed as in some of the tpl we are using jQuery.ready *}
		<script type="text/javascript" src="libraries/jquery/jquery.min.js"></script>
		<!--[if IE]>
		<script type="text/javascript" src="libraries/html5shim/html5.js"></script>
		<script type="text/javascript" src="libraries/html5shim/respond.js"></script>
		<![endif]-->
		{* ends *}

		{* ADD <script> INCLUDES in JSResources.tpl - for better performance *}
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<script type="text/javascript" src="layouts/mazzy/modules/Vtiger/resources/Mazzy.js"></script>
		<link href="layouts/mazzy/modules/Vtiger/resources/responsive-tables/responsive-tables.css" rel="stylesheet">
		<script type="text/javascript" src="layouts/mazzy/modules/Vtiger/resources/responsive-tables/responsive-tables.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function(){
				if($.browser.mozilla){
			        $(window).load(function(){
			            $("#mazzy-sidebar-left, #mazzy-sidebar-right").mCustomScrollbar({
				            scrollbarPosition: "outside",
			            });
			            
			            $(".mCSB_outside + .mCSB_scrollTools").attr("style","right:-8px;");
			        });
				}
			});
		</script>

		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCT3UxU2Fi-q0QozSrAbcdhwY5e42ZqqY0"></script>
	</head>
		
	<body data-skinpath="{$SKIN_PATH}" data-language="{$LANGUAGE}">		
				<div class="mycloaderbg">
			<div class="mycloadingcontent" style="margin-top:10%; text-align:center">
				{if isset($COMPANY_LOGO)}
				<img src="{$COMPANY_LOGO->get('imagepath')}" title="{$COMPANY_LOGO->get('title')}" alt="{$COMPANY_LOGO->get('alt')}" style="max-width:50%" />
				{else}
				<h2>Loading...</h2>
				{/if}
				<br>
				<i class="fa fa-spin fa-star"></i>
			</div>
		</div>
		<div id="js_strings" class="hide noprint">{Zend_Json::encode($LANGUAGE_STRINGS)}</div>
		{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
		<input type="hidden" id="start_day" value="{$CURRENT_USER_MODEL->get('dayoftheweek')}" />
		<input type="hidden" id="row_type" value="{$CURRENT_USER_MODEL->get('rowheight')}" />
		<input type="hidden" id="current_user_id" value="{$CURRENT_USER_MODEL->get('id')}" />
		
		{if $MODULE neq ""}{include file='MazzySideBarLeft.tpl'|@vtemplate_path:$MODULE}{/if}
		{if $MODULE neq ""}{include file='MazzySideBarRight.tpl'|@vtemplate_path:$MODULE}{/if}
		{assign var=LEFTPANELHIDE value=$CURRENT_USER_MODEL->get('leftpanelhide')}

					<div id="page" style="{if $LEFTPANELHIDE eq '0'}margin-right: 0px;{else}margin-right:200px;{/if}">

			<!-- container which holds data temporarly for pjax calls -->
			<div id="pjaxContainer" class="hide noprint"></div>
{/strip}
