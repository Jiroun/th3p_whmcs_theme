                    </div>

                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-md-none col-md-3 sidebar sidebar-secondary">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                <div class="clearfix"></div>
            </div>
        </div>
    </section>
    <section id="pmntmthod">    
          <ul style="text-align: center;padding-top: 15px;padding-bottom: 15px;font-size: 15px;font-weight: normal;background-color: #f8f8f8;border-top: 1px solid #ddd;color: #666;margin-bottom: 0px;display: contents;" class="payment-list">
            <li  style="text-align: center;display: inline-block;width:100%;background-color: #f8f8f8;border-top: 1px solid #ddd;" title="{$LANG.fotterh43}">
                <a title="{$LANG.fotterh43}" href="{$LANG.payment_link}">
                    <img title="{$LANG.fotterh43}" style="text-align: center;max-height:50px;max-width:100%;height:50px;width:100%;background-color: #f8f8f8;border-top: 1px solid #ddd;" src="{$systemurl}/svg/Payments.svg" alt="Payments" />
                </a>     
            </li>
                    
          </ul>
    </section>          
    <footer style="padding: 15px 0 15px;" id="footer" class="footer">
        <div class="container">
            <ul class="list-inline mb-7 text-center float-lg-right">
                {include file="$template/includes/social-accounts.tpl"}


            {if $languagechangeenabled && count($locales) > 1}
                {if $language eq 'arabic'}
                    <li class="list-inline-item">
                            <button type="button" class="btn">                    
<div class="d-inline-block align-middle">
                        <a style="color:#fff;" href="{$footerurl}language=english">English</a>
             </div>   
             </button>
                    </li>
                {else}
                                    <li class="list-inline-item">
                            <button type="button" class="btn">                    
<div class="d-inline-block align-middle">
                    <a style="color:#fff;" href="{$footerurl}language=arabic">العربية</a>
             </div>   
             </button>
                </li>
            {/if}
                   
                    {if !$loggedin}
                    <li class="list-inline-item">
                        <button type="button" class="btn" data-toggle="modal" data-target="#modalChooseCurrency">
                            {$activeCurrency.code}
                        </button>
                    </li>                    
                    {/if}
                {/if}
            </ul>

            <ul class="nav justify-content-center justify-content-lg-start mb-7">
                <li class="nav-item">
                    <a class="nav-link" href="{$WEB_ROOT}/contact.php">
                        {lang key='contactus'}
                    </a>
                </li>
                <li class="nav-item">
            <a class="nav-link" target="_blank" href="https://blog.{$WEB_ROOT}/">{lang key='fotterh41a'}</a> 
                            </li>
                <li class="nav-item">
            <a class="nav-link"  href="{$WEB_ROOT}/privacy.php">{$LANG.fotterh41b}</a> 
                            </li>
                <li class="nav-item">
            <a class="nav-link" href="{$WEB_ROOT}/terms.php">{$LANG.fotterh41c}</a>                </li>
                {*
                {if $acceptTOS}
                    <li class="nav-item">
                        <a class="nav-link" href="{$tosURL}" target="_blank">{lang key='ordertos'}</a>
                    </li>
                {/if}
                *}
            </ul>
        </div>



</footer>
    <div id="fullpage-overlay" class="w-hidden">
        <div class="outer-wrapper">
            <div class="inner-wrapper">
                <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg" alt="{lang key='footer_overlay_spinner'}" >
                <br>
                <span class="msg"></span>
            </div>
        </div>
    </div>

    <div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">{lang key='close'}</span>
                    </button>
                </div>
                <div class="modal-body">
                    {lang key='loading'}
                </div>
                <div class="modal-footer">
                    <div class="float-left loader">
                        <i class="fas fa-circle-notch fa-spin"></i>
                        {lang key='loading'}
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        {lang key='close'}
                    </button>
                    <button type="button" class="btn btn-primary modal-submit">
                        {lang key='submit'}
                    </button>
                </div>
            </div>
        </div>
    </div>

    <form method="get" action="{$currentpagelinkback}">
        <div class="modal modal-localisation" id="modalChooseCurrency" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                        {if !$loggedin && $currencies}
                            <p class="h5 pt-12">{lang key='choosecurrency'}</p>
                            <div class="row item-selector">
                                <input type="hidden" name="currency" value="">
                                {foreach $currencies as $selectCurrency}
                                    <div class="col-12">
                                        <a href="#" class="item{if $activeCurrency.id == $selectCurrency.id} active{/if}" data-value="{$selectCurrency.id}">
                                            {$selectCurrency.prefix} {$selectCurrency.code}
                                        </a>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default">{lang key='apply'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <form method="get" action="{$currentpagelinkback}">
        <div class="modal modal-localisation" id="modalChooseLanguage" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>

                        {if $languagechangeenabled && count($locales) > 1}
                            <h5 class="h5 pt-5 pb-3">{lang key='chooselanguage'}</h5>
                            <div class="row item-selector">
                            <input type="hidden" name="language" value="">
                                {foreach $locales as $locale}
                                    <div class="col-4">
                                        <a href="#" class="item{if $language == $locale.language} active{/if}" data-value="{$locale.language}">
                                            {$locale.localisedName}
                                        </a>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default">{lang key='apply'}</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="copyright_line">
    	<div class="container">
        	<div class="col-sm-12 footer_th3p">
        		Copyright © 2019 - {$date_year} {$companyname} . All Rights Reserved.
            </div>
        </div>
    </div>
    {if !$loggedin && $adminLoggedIn}
        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
            <i class="fas fa-redo-alt"></i>
            <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
        </a>
    {/if}
    

        
        

    {include file="$template/includes/generate-password.tpl"}

    {$footeroutput}

</body>
</html>
