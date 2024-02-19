{if $email_not_verified}
    <h2>تحذير!</h2>
    <p>لايمكنك البدء بتأكيد رقم هاتفك، قبل التحقق من البريد الالكتروني أولا.</p>
{else}
    {if $note}
        <p>{$note}</p>
    {elseif $already_verified}
        <h2>شكرًا!</h2>
        <p>لقد تم التحقق من رقم هاتفك بالفعل.</p>
    {elseif $code_verified}
        <h2>شكرًا!</h2>
        <p>تم التحقق من رقم هاتفك بنجاح.</p>
    {elseif $code_sent}
        <h2>إدخال رمز التحقق</h2>
        <p>يرجى إدخال الرمز المرسل إلى رقم هاتفك عبر واتساب في الحقل أدناه:</p>
        {if $error_message}
        <div class="alert alert-danger">{$error_message}</div>
        {/if}
        <form method="post" action="phone_verification.php">
            <div class="form-group">
                <label for="verificationCode">رمز التحقق:</label>
                <input type="text" class="form-control" id="verificationCode" name="verificationCode" required>
            </div>
            <button type="submit" name="action" value="verify_code" class="btn btn-primary">تحقق</button>
        </form>
    {else}
        <h2>تحقق من رقم الهاتف</h2>
        <p>هل ترغب في إرسال كود التحقق إلى الرقم التالي؟</p>
        <p style="direction: ltr;"><strong>{$phonenumber}</strong></p>
        <p>سيتم إرسال الكود عبر واتساب.</p>
        <form method="post" action="phone_verification.php">
            <button type="submit" name="action" value="send_code" class="btn btn-primary">أرسل الكود</button>
            <button type="submit" name="action" value="edit_number" class="btn btn-secondary" title="سيتم توجيهك إلى صفحة معلومات المستخدم، قم بتعديل الرقم ثم عد لهذه الصفحة.">تعديل الرقم</button>
        </form>
        <p class="text-muted">عند النقر على "تعديل الرقم"، سيتم توجيهك إلى صفحة معلومات المستخدم. قم بتعديل الرقم ثم عد إلى <a href="{$WEB_ROOT}/phone_verification.php">هذه الصفحة</a>.</p>
    {/if}
{/if}
