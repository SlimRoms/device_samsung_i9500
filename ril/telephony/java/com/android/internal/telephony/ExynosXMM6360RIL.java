/*
 * Copyright (C) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;

import android.content.Context;
import android.media.AudioManager;
import android.os.AsyncResult;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.telephony.SmsMessage;
import android.os.SystemProperties;
import android.os.SystemClock;
import android.provider.Settings;
import android.text.TextUtils;
import android.telephony.Rlog;

import com.android.internal.telephony.RILConstants;
import com.android.internal.telephony.gsm.SmsBroadcastConfigInfo;
import com.android.internal.telephony.cdma.CdmaSmsBroadcastConfigInfo;

public class ExynosXMM6360RIL extends RIL implements CommandsInterface {

    public ExynosXMM6360RIL(Context context, int preferredNetworkType, int cdmaSubscription) {
        super(context, preferredNetworkType, cdmaSubscription);
    }

    public ExynosXMM6360RIL(Context context, int preferredNetworkType,
                    int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
    }

    @Override
    public void getGsmBroadcastConfig(Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: getGsmBroadcastConfig");

        CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
        AsyncResult.forMessage(response, null, e);
        response.sendToTarget();
    }

    @Override
    public void setGsmBroadcastConfig(SmsBroadcastConfigInfo[] config, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setGsmBroadcastConfig");

        CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
        AsyncResult.forMessage(response, null, e);
        response.sendToTarget();
    }

    @Override
    public void setGsmBroadcastActivation(boolean activate, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setGsmBroadcastActivation");

        CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
        AsyncResult.forMessage(response, null, e);
        response.sendToTarget();
    }

    @Override
    public void getCdmaBroadcastConfig(Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: getCdmaBroadcastConfig");

        CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
        AsyncResult.forMessage(response, null, e);
        response.sendToTarget();
    }

    @Override
    public void setCdmaBroadcastConfig(CdmaSmsBroadcastConfigInfo[] configs, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setCdmaBroadcastConfig");

        CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
        AsyncResult.forMessage(response, null, e);
        response.sendToTarget();
    }

    @Override
    public void setCdmaBroadcastActivation(boolean activate, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setCdmaBroadcastActivation");

        CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
        AsyncResult.forMessage(response, null, e);
        response.sendToTarget();
    }

    @Override
    public void getCellInfoList(Message result) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: getCellInfoList");

        CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
        AsyncResult.forMessage(result, null, e);
        result.sendToTarget();
    }
}
