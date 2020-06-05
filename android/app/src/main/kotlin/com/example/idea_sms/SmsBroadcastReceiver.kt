package com.example.idea_sms

import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.SmsManager
import com.example.idea_sms.MainActivity.Companion.RECEIVED_SMS_INFO
import java.text.SimpleDateFormat
import java.util.*

class SmsBroadcastReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val sdf = SimpleDateFormat("yyyy-MM-dd hh:mm:ss")
        val smsReceiveTime = sdf.format(Date())
        val date = "2019-10-28 02:05"
        println("Sms Send time: $smsReceiveTime")

        val dbHelper = DBHelper(context)

        val action = intent.action
        var sendResult = false

//        val sentId = intent.getIntExtra(MainActivity.RECEIVED_SMS_SENT, -1)
//        val deliveredId = intent.getIntExtra(MainActivity.RECEIVED_SMS_DELIVERED,-1)


        if (action == MainActivity.ACTION_SMS_SENT) {
            val smsInfo = intent.getStringArrayExtra(RECEIVED_SMS_INFO)

            when (resultCode) {
                Activity.RESULT_OK -> {
                    println("SMS is sent")
                    sendResult = true
                }
                SmsManager.RESULT_ERROR_GENERIC_FAILURE -> {
                    println("Generic failure")
                }


                SmsManager.RESULT_ERROR_NO_SERVICE -> {
                    println("No service")
                }

                SmsManager.RESULT_ERROR_NULL_PDU -> {
                    println("Null PDU")
                }

                SmsManager.RESULT_ERROR_RADIO_OFF -> {
                    println("Radio off")
                }
            }

//
//            try {
            if (smsInfo!!.isNotEmpty()) {
                println("Sms Send Info: ID: ${smsInfo[0]} Mobile: ${smsInfo[1]} User: ${smsInfo[2]}, Message: ${smsInfo[3]}  Send Result: $sendResult")
                try {
                    var send = 0

                    if (sendResult) {
                        send = 1
                    }

//

                    println("\nOld send result: ${smsInfo[4]}")
//                    if (smsInfo[4]!!.isNullOrEmpty()) {
//                        println("Data has been tried to insert")
//                        // Data insert in history table
                        dbHelper.insertData(DBHelper.SMS_HISTORY_TABLE, smsInfo[0], smsInfo[1], smsInfo[2], smsInfo[3], smsReceiveTime, send)
//
//                    } else {
//                        println("Data has been tried to update")
//                        dbHelper.update(DBHelper.SMS_HISTORY_TABLE, smsInfo[0], smsInfo[1], smsInfo[2], smsInfo[3], smsReceiveTime, send)
//                    }
                } catch (e: Exception) {
                    println("DB Inserting error: $e")
                }

            }
        }

//        else if ((action == MainActivity.ACTION_SMS_DELIVERED ) &&( deliveredId != -1)) {
//            when (resultCode) {
//                Activity.RESULT_OK -> {
//                    println("SMS delivered")
//                    println("Delivered ID: $deliveredId")
//                }
//
//                Activity.RESULT_CANCELED -> {
//                    println("SMS not delivered")
//
//                }
//            }
//        }
    }
}
