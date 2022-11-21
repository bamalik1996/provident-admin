<?php

namespace App\Listeners;

use App\Events\OrderLogEvent;
use App\Models\OrderLog;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class OrderLogListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\OrderLogEvent  $event
     * @return void
     */
    public function handle(OrderLogEvent $event)
    {
        OrderLog::create($event->data);

        $data['email_template'] = getEmailTemplateById(6);
        $data['status'] = $event->data['status'];
        $data['order'] = $event->data['order'];

        if ($data['email_template']) {
            Mail::send('emails.orders.customer.index', $data, function ($message) use ($event, $data) {
                $message->to($event->data['email']);
                $message->subject(getValueSwitcher($data['email_template'], 'subject'));
            });
        }
    }
}
