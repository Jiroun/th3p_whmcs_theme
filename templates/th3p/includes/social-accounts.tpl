<li class="list-inline-item">
    {foreach $socialAccounts as $account}
        <a class="btn btn-icon mb-1" href="{$account->getUrl()}" target="_blank">
            <i class="{$account->getFontAwesomeIcon()}"></i>
        </a>
    {/foreach}
</li>