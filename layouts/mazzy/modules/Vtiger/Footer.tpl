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


		<input id='activityReminder' class='hide noprint' type="hidden" value="{$ACTIVITY_REMINDER}"/>

		{* Feedback side-panel button *}
		{if $HEADER_LINKS && $MAIN_PRODUCT_SUPPORT && !$MAIN_PRODUCT_WHITELABEL}
		{assign var="FIRSTHEADERLINK" value=$HEADER_LINKS.0}
		{assign var="FIRSTHEADERLINKCHILDRENS" value=$FIRSTHEADERLINK->get('childlinks')}
		{assign var="FEEDBACKLINKMODEL" value=$FIRSTHEADERLINKCHILDRENS.2}
		<div id="userfeedback" class="feedback noprint">
			<a href="https://discussions.vtiger.com" target="_blank" xonclick="{$FEEDBACKLINKMODEL->get('linkurl')}" class="handle">{vtranslate("LBL_FEEDBACK", "Vtiger")}</a>
		</div>
		{/if}

		{if !$MAIN_PRODUCT_WHITELABEL && isset($CURRENT_USER_MODEL)}
		<footer class="noprint">
                    <div class="vtFooter">
			<p>
				{vtranslate('POWEREDBY')} {$VTIGER_VERSION} &nbsp;
				&copy; 2004 - {date('Y')}&nbsp&nbsp;
				<a href="//www.vtiger.com" target="_blank">vtiger.com</a>
				&nbsp;|&nbsp;
				<a href="#" onclick="window.open('../copyright.html','copyright', 'height=115,width=575').moveTo(210,620)">{vtranslate('LBL_READ_LICENSE')}</a>
				&nbsp;|&nbsp;
				<a href="https://www.vtiger.com/crm/privacy-policy" target="_blank">{vtranslate('LBL_PRIVACY_POLICY')}</a>
			</p>
                     </div>
		</footer>
		{/if}
		
		{* javascript files *}
		{include file='JSResources.tpl'|@vtemplate_path}
		</div>
		
		
		<div id="mazzyMobileModal" class="modal hide fade" style="top:40%;width: 300px; z-index:99999999999;" tabindex="-1" role="dialog" aria-labelledby="mazzyMobileModalLabel" aria-hidden="true">
		  <div class="modal-header">
		    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		    <h3 id="mazzyMobileModalLabel">Switch to <b>Mobile Optimized</b> version</h3>
		  </div>
		  <div class=" modal-body">
		  	<div class="progressSwithing"></div>
		    <p class="mazzyModalBody">This theme comes with 2 different version, one optimized for <b>desktop and tablets</b> with big resolutions, and the other one optimized for tablet, <b>smartphones and other devices with small screen</b>.</p>
		  </div>
		  <div class="modal-footer">
		    <button class="btn" data-dismiss="modal" aria-hidden="true" onclick="setCookie('mobileswitch', 'declined', 0); return true;">Cancel</button>
		    <a class="btn btn-red" onclick="switchTheme('mobile');">Switch to Mobile Theme</a>		  
			</div>
		</div>
		
		
	</body>
	{literal}
	<script>
		$(function(){
			
			
			function getColTotals(){	
				
				var tfoot="";
				var cnt=1;
				var colids = new Array();
				$("b.listsum").remove();
				$(".listViewEntriesTable > tfoot").remove();
				
				$(".listViewEntriesTable > tbody > tr.listViewEntries:first > td").each(function(item,i) {
				    
				    var fieldtype=$(this).attr("data-field-type");			    
				    tfoot+="<th class='medium'>";
				    if(fieldtype=="double" || fieldtype=="currency"){ colids.push(cnt); tfoot+="<b style='font-size:15px;' class='listsum' col-id='"+cnt+"'>ss</b>"; }
				    tfoot+="</th>";
				    cnt+=1;
				});
				
				$(".listViewEntriesTable").append('<tfoot><tr class="listViewHeaders">'+tfoot+'</tr></tfoot>');
				
				
				var tcount=new Array();
				for (ct = 0; ct < colids.length; ct++) tcount[ct]=0;
				
				$(".listViewEntries").each(function (item,i){
					for (ct = 0; ct < colids.length; ct++) { 
					    var cc = $(this).children("td:nth-child("+colids[ct]+")");
					    var value=cc.text().replace(/[^0-9.,]*/g, '').replace(/,([^,]*)$/, '.$1').replace(/(\d+).(?=\d{3}(\D|$))/g, "$1").replace(/(\d+),(?=\d{3}(\D|$))/g, "$1");

					    
					    console.log(value);
					    numValf = parseFloat(value);
					    if(cc.html().indexOf('style="color:#FF0000;"') > -1)  
					    	tcount[ct]-=  numValf;
					    else tcount[ct]+=  numValf;
					}					
				});
				
				var zx=0;		
						
				$("b.listsum").each(function(item,i) {								
					$(this).html(tcount[zx].toFixed(2));
					zx+=1;
				});
				
				
				
			}	
			
			getColTotals();
			
			$(document).ajaxComplete(function(event,xhr,settings){			  
			  if(settings.container=="#pjaxContainer") getColTotals();
			});
			
			
			
			
		});
	</script>
	
	{/literal}

</html>
{/strip}
