{include file="$template/includes/tablelist.tpl" tableName="InvoicesList" filterColumn="4"}

<script>
    jQuery(document).ready(function() {
        var table = jQuery('#tableInvoicesList').show().DataTable();

        {if $orderby == 'default'}
            table.order([4, 'desc'], [2, 'asc']);
        {elseif $orderby == 'invoicenum'}
            table.order(0, '{$sort}');
        {elseif $orderby == 'date'}
            table.order(1, '{$sort}');
        {elseif $orderby == 'duedate'}
            table.order(2, '{$sort}');
        {elseif $orderby == 'total'}
            table.order(3, '{$sort}');
        {elseif $orderby == 'status'}
            table.order(4, '{$sort}');
        {/if}
        
        table.order([1,'des']); // added by aladdin - sort by date
        
        table.draw();
        jQuery('#tableLoading').hide();
    });
</script>

<div class="table-container clearfix">
    <table id="tableInvoicesList" class="table table-list w-hidden">
        <thead>
            <tr>
                <th>{lang key='invoicestitle'}</th>
                <th>{lang key='invoicesdatecreated'}</th>
                <th>{lang key='invoicesdatedue'}</th>
                <th>{lang key='invoicestotal'}</th>
                <th>{lang key='invoicesstatus'}</th>
            </tr>
        </thead>
        <tbody>
            {foreach $invoices as $invoice}
                <tr onclick="clickableSafeRedirect(event, 'viewinvoice.php?id={$invoice.id}', false)">
                    <td class="text-center">{$invoice.invoicenum}</td>
                    <td class="text-center"><span class="w-hidden">{$invoice.normalisedDateCreated}</span>{$invoice.datecreated}</td>
                    <td class="text-center"><span class="w-hidden">{$invoice.normalisedDateDue}</span>{$invoice.datedue}</td>
                    <td class="text-center" data-order="{$invoice.totalnum}">{$invoice.total}</td>
                    {* <td><span class="label status status-{$invoice.statusClass}">{$invoice.status}</span></td>  *}
                    <td class="text-center">
                      <span class="label status status-{$invoice.statusClass}">
                        {if $invoice.statusClass|strtolower == 'draft'}
                          <i class="fas fa-pencil-alt"></i> {$invoice.status}
                        {elseif $invoice.statusClass|strtolower == 'unpaid'}
                          <i class="far fa-clock"></i> {$invoice.status}
                        {elseif $invoice.statusClass|strtolower == 'paid'}
                          <i class="fas fa-check-circle"></i> {$invoice.status}
                        {elseif $invoice.statusClass|strtolower == 'refunded'}
                          <i class="fas fa-undo-alt"></i> {$invoice.status}
                        {elseif $invoice.statusClass|strtolower == 'collections'}
                          <i class="fas fa-exclamation-triangle"></i> {$invoice.status}
                        {elseif $invoice.statusClass|strtolower == 'payment-pending'}
                          <i class="fas fa-exclamation-circle"></i> {$invoice.status}
                        {elseif $invoice.statusClass|strtolower == 'cancelled'}
                          <i class="fas fa-times-circle"></i> {$invoice.status}
                        {/if}
                      </span>
                    </td>
   

                </tr>
            {/foreach}
        </tbody>
    </table>
    <div class="text-center" id="tableLoading">
        <p><i class="fas fa-spinner fa-spin"></i> {lang key='loading'}</p>
    </div>
</div>
