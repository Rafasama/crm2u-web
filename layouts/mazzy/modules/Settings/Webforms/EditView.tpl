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
<form class="form-horizontal recordEditView" id="EditView" name="EditView" method="post" action="index.php" enctype="multipart/form-data">
{include file="EditViewBlocks.tpl"|@vtemplate_path:$QUALIFIED_MODULE}
<hr>
<div class="targetFieldsTableContainer">
	{include file="FieldsEditView.tpl"|@vtemplate_path:$QUALIFIED_MODULE}
</div>

<br>	
{include file="EditViewActions.tpl"|@vtemplate_path:Vtiger}
<div class="row-fluid" style="margin-bottom:150px;"></div>
</form>

{/strip}