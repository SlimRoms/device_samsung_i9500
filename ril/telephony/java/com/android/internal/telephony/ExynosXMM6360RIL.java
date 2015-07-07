/*
 * Copyright (c) 2015, The CyanogenMod Project. All rights reserved.
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
import android.telephony.Rlog;
import android.os.AsyncResult;
import android.os.Message;
import android.os.Parcel;
import android.telephony.PhoneNumberUtils;
import android.telephony.SignalStrength;
import android.telephony.SmsManager;
import com.android.internal.telephony.cdma.CdmaSmsBroadcastConfigInfo;
import com.android.internal.telephony.gsm.SmsBroadcastConfigInfo;
import com.android.internal.telephony.uicc.IccCardApplicationStatus;
import com.android.internal.telephony.uicc.IccCardStatus;
import com.android.internal.telephony.uicc.IccRefreshResponse;
import java.util.ArrayList;
import java.util.Collections;

public class ExynosXMM6360RIL extends RIL {

    /**********************************************************
     * SAMSUNG REQUESTS
     **********************************************************/
    static final boolean RILJ_LOGD = true;
    static final boolean RILJ_LOGV = false;

    private static final int RIL_REQUEST_DIAL_EMERGENCY_CALL = 10016;

    private static final int RIL_REQUEST_SIM_TRANSMIT_BASIC = 10026;
    private static final int RIL_REQUEST_SIM_OPEN_CHANNEL = 10027;
    private static final int RIL_REQUEST_SIM_CLOSE_CHANNEL = 10028;
    private static final int RIL_REQUEST_SIM_TRANSMIT_CHANNEL = 10029;

    private Message mPendingGetSimStatus;

    public ExynosXMM6360RIL(Context context, int preferredNetworkType, int cdmaSubscription) {
        super(context, preferredNetworkType, cdmaSubscription, null);
        mQANElements = 6;
    }

    public ExynosXMM6360RIL(Context context, int preferredNetworkType,
                   int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
        mQANElements = 6;
    }

    @Override
    public void dial(String address, int clirMode, UUSInfo uusInfo, Message result) {
        if (PhoneNumberUtils.isEmergencyNumber(address)) {
            dialEmergencyCall(address, clirMode, result);
            return;
        }

        RILRequest rr = RILRequest.obtain(RIL_REQUEST_DIAL, result);

        rr.mParcel.writeString(address);
        rr.mParcel.writeInt(clirMode);

        if (uusInfo == null) {
            rr.mParcel.writeInt(0); // UUS information is absent
        } else {
            rr.mParcel.writeInt(1); // UUS information is present
            rr.mParcel.writeInt(uusInfo.getType());
            rr.mParcel.writeInt(uusInfo.getDcs());
            rr.mParcel.writeByteArray(uusInfo.getUserData());
        }

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));

        send(rr);
    }

    public void dialEmergencyCall(String address, int clirMode, Message result) {
        RILRequest rr;

        rr = RILRequest.obtain(RIL_REQUEST_DIAL_EMERGENCY_CALL, result);
        rr.mParcel.writeString(address + "/");
        rr.mParcel.writeInt(clirMode);
        rr.mParcel.writeInt(0);  // UUS information is absent

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));

        send(rr);
    }

    @Override
    public void getGsmBroadcastConfig(Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: getGsmBroadcastConfig");

        if (response != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, e);
            response.sendToTarget();
        }
    }

    @Override
    public void setGsmBroadcastConfig(SmsBroadcastConfigInfo[] config, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setGsmBroadcastConfig");

        if (response != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, e);
            response.sendToTarget();
        }
    }

    @Override
    public void setGsmBroadcastActivation(boolean activate, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setGsmBroadcastActivation");

        if (response != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, e);
            response.sendToTarget();
        }
    }

    @Override
    public void getCdmaBroadcastConfig(Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: getCdmaBroadcastConfig");

        if (response != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, e);
            response.sendToTarget();
        }
    }

    @Override
    public void setCdmaBroadcastConfig(CdmaSmsBroadcastConfigInfo[] configs, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setCdmaBroadcastConfig");

        if (response != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, e);
            response.sendToTarget();
        }
    }

    @Override
    public void setCdmaBroadcastActivation(boolean activate, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setCdmaBroadcastActivation");

        if (response != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, e);
            response.sendToTarget();
        }
    }

    @Override
    public void getCellInfoList(Message result) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: getCellInfoList");

        if (result != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(result, null, e);
            result.sendToTarget();
        }
    }

    @Override
    public void setDataAllowed(boolean allowed, Message result) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setDataAllowed");

        if (result != null) {
            AsyncResult.forMessage(result, 0, null);
            result.sendToTarget();
        }
    }

    @Override
    public void setCellInfoListRate(int rateInMillis, Message response) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: setCellInfoListRate");

        if (response != null) {
            CommandException e = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(response, null, e);
            response.sendToTarget();
        }
    }

    private void constructGsmSendSmsRilRequest(RILRequest rr, String smscPDU, String pdu) {
        rr.mParcel.writeInt(2);
        rr.mParcel.writeString(smscPDU);
        rr.mParcel.writeString(pdu);
    }

    /**
     * The RIL can't handle the RIL_REQUEST_SEND_SMS_EXPECT_MORE
     * request properly, so we use RIL_REQUEST_SEND_SMS instead.
     */
    @Override
    public void sendSMSExpectMore(String smscPDU, String pdu, Message result) {
        Rlog.v(RILJ_LOG_TAG, "ExynosXMM6360RIL: sendSMSExpectMore");

        RILRequest rr = RILRequest.obtain(RIL_REQUEST_SEND_SMS, result);
        constructGsmSendSmsRilRequest(rr, smscPDU, pdu);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest));

        send(rr);
    }

    /*
     * Hack for Lollipop
     *
     * The system now queries for SIM status before radio on, resulting
     * in getting an APPSTATE_DETECTED state. The RIL does not send an
     * RIL_UNSOL_RESPONSE_SIM_STATUS_CHANGED message after the SIM is
     * initialized, so delay the message until the radio is on.
     */
    @Override
    public void
    getIccCardStatus(Message result) {
        if (mState != RadioState.RADIO_ON) {
            mPendingGetSimStatus = result;
        } else {
            super.getIccCardStatus(result);
        }
    }

    @Override
    protected void switchToRadioState(RadioState newState) {
        super.switchToRadioState(newState);

        if (newState == RadioState.RADIO_ON && mPendingGetSimStatus != null) {
            super.getIccCardStatus(mPendingGetSimStatus);
            mPendingGetSimStatus = null;
        }
    }
}
