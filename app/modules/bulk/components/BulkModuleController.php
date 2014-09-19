<?php

/**
 *
 * @author James Makau <jacjimus@gmail.com>
 */
class BulkModuleController extends Controller {

        const MENU_BULK = 'BULK';
        const MENU_BULK_SEND = 'BULK_SEND';
        const MENU_BULK_TEMPLATE = 'BULK_TEMPLATE';
        const resourceBulkLabel = 'Bulk Sms Templates';

        public function init()
        {
                parent::init();
        }

}
