<section>
    <div class="container-fluid without-padding">

                <!-- Container for main page display content -->
		        <div  style="padding-top:0px;" class="col-xs-12">

		            
{if $language eq 'arabic'}
<div style="direction:rtl;text-align:right;padding-right: 60px;" class="container">

{else}
<div style="direction:ltr;text-align:left;padding-left: 60px;" class="container">

{/if}

{if $language eq 'arabic'}
    <div style="text-align: right;" class="error-container boxed">

{else}
    <div style="text-align: left;" class="error-container boxed">

{/if}

{if $language eq 'arabic'}
<h1 style="direction:rtl;text-align:right">{$LANG.aboutus_title}</h1>

{else}
<h1 style="direction:ltr;text-align:left">{$LANG.aboutus_title}</h1>

{/if}




<div class="col-sm-12">
    
    
    <p>{$LANG.aboutus_part2}</p>
</div>

                </div><!-- /.main-content -->
                            <div class="clearfix"></div>
        </div>
</section>
<br><br>