{assign var="allOneTime" value=true}
{foreach $services as $service}
    {if $service.billingcycle neq 'مرة واحدة' and $service.billingcycle neq 'One Time'}
        {assign var="allOneTime" value=false}
        {break}
    {/if}
{/foreach}

{if $allOneTime}
{else}
{/if}

{* ADDED BY ALADDIN *}



{if $allOneTime}
{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="4" noSortColumns="0"}
{else}
{include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="5" noSortColumns="0"}

{/if}

{* {include file="$template/includes/tablelist.tpl" tableName="ServicesList" filterColumn="5" noSortColumns="0"} *}



{if $allOneTime}
<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableServicesList').show().DataTable();

        {if $orderby == 'product'}
            table.order([1, '{$sort}'], [3, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(2, '{$sort}');
 //       {elseif $orderby == 'nextduedate'}
 //           table.order(3, '{$sort}');
            // ADDED BY ALADDIN
        {elseif $orderby == 'regdate'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(4, '{$sort}');
        {/if}
        // added by aladdin - sort by date
        table.order([3,'des']);
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

{else}
<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableServicesList').show().DataTable();

        {if $orderby == 'product'}
            table.order([1, '{$sort}'], [4, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(3, '{$sort}');
            // ADDED BY ALADDIN
        {elseif $orderby == 'regdate'}
            table.order(4, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(5, '{$sort}');
        {/if}
        // added by aladdin - sort by date
        table.order([4,'des']);
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>
{/if}


<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableServicesList').show().DataTable();

        {if $orderby == 'product'}
            table.order([1, '{$sort}'], [4, 'asc']);
        {elseif $orderby == 'amount' || $orderby == 'billingcycle'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'nextduedate'}
            table.order(3, '{$sort}');
            // ADDED BY ALADDIN
        {elseif $orderby == 'regdate'}
            table.order(4, '{$sort}');
        {elseif $orderby == 'domainstatus'}
            table.order(5, '{$sort}');
        {/if}
        // added by aladdin - sort by date
        table.order([4,'des']);
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container clearfix">
    <table id="tableServicesList" class="table table-list w-hidden">
        <thead>
            <tr>
                <th></th>
                <th>{lang key='orderproduct'}</th>
                <th>{lang key='clientareaaddonpricing'}</th>
                {if $allOneTime}
                {else}
                <th>{lang key='clientareahostingnextduedate'}</th>
                {/if}
               <!-- <th>{lang key='clientareahostingnextduedate'}</th> -->
                <!-- ADD TABLE HEADER FOR REGISTERED DATE -->
                <th>{lang key='clientareahostingregdate1'}</th>
                <th>{lang key='clientareastatus'}</th>
            </tr>
        </thead>
        <tbody>
            {foreach $services as $service}
                <tr onclick="clickableSafeRedirect(event, 'clientarea.php?action=productdetails&amp;id={$service.id}', false)">
                    <td class="py-0 text-center{if $service.sslStatus} ssl-info{/if}" data-element-id="{$service.id}" data-type="service"{if $service.domain} data-domain="{$service.domain}"{/if}>
                        {if $service.sslStatus}
                        {* <img src="{$service.sslStatus->getImagePath()}" data-toggle="tooltip" title="{$service.sslStatus->getTooltipContent()}" class="{$service.sslStatus->getClass()}" width="25"> *}
                        {elseif !$service.isActive}
                           {* <img src="{$BASE_PATH_IMG}/ssl/ssl-inactive-domain.png" data-toggle="tooltip" title="{lang key='sslState.sslInactiveService'}" width="25"> *}
                        {/if}
                    </td>
                    <td><strong>{$service.product}</strong>{if $service.domain}<br /><a href="http://{$service.domain}" target="_blank">{$service.domain}</a>{/if}</td>
                    
                    {* {if $service.nextduedate eq '-' or $service.isActive eq false} } *}
                    {if $service.billingcycle eq 'مرة واحدة' or $service.billingcycle eq 'One Time'}
                        <td class="text-center" data-order="{$service.amountnum}">{$service.amount}</td>
                    {else}
                        <td class="text-center" data-order="{$service.amountnum}">{$service.amount} <small class="text-muted">{$service.billingcycle}</small></td>
                    {/if}
                    
                    
                    
                    {* <td class="text-center" data-order="{$service.amountnum}">{$service.amount} <small class="text-muted">{$service.billingcycle}</small></td> *}
                    
                    
                    {if $allOneTime}
                    {else}
                    <td class="text-center"><span class="w-hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td>
                    {/if}

                    {*<td class="text-center"><span class="w-hidden">{$service.normalisedNextDueDate}</span>{$service.nextduedate}</td> *}
                    <!-- ADD TABLE CONTENT FOR REGISTERED DATE -->
                    <td class="text-center"><span class="w-hidden">{$service.normalisedRegDate}</span>{$service.regdate}</td>
                    {* <td class="text-center"><span class="label status status-{$service.status|strtolower}">{$service.statustext}</span></td> *}
                    
                    <td class="text-center">
                      {if $service.status|strtolower eq 'pending'}
                        <span class="badge badge-warning">
                          <i class="fas fa-clock"></i> {$service.statustext}
                        </span>
                      {elseif $service.status|strtolower eq 'active'}
                        <span class="badge badge-success">
                          <i class="fas fa-check-circle"></i> {$service.statustext}
                        </span>
                      {elseif $service.status|strtolower eq 'completed'}
                        <span class="badge badge-success">
                          <i class="fas fa-check-circle"></i> {$service.statustext}
                        </span>
                      {elseif $service.status|strtolower eq 'fraud'}
                        <span class="badge badge-danger">
                          <i class="fas fa-exclamation-circle"></i> {$service.statustext}
                        </span>
                      {elseif $service.status|strtolower eq 'cancelled'}
                        <span class="badge badge-secondary">
                          <i class="fas fa-times-circle"></i> {$service.statustext}
                        </span>
                      {elseif $service.status|strtolower eq 'suspended'}
                        <span class="badge badge-warning">
                          <i class="fas fa-pause-circle"></i> {$service.statustext}
                        </span>
                      {elseif $service.status|strtolower eq 'terminated'}
                        <span class="badge badge-danger">
                          <i class="fas fa-times-circle"></i> {$service.statustext}
                        </span>
                      {/if}
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
    </div>
</div>
