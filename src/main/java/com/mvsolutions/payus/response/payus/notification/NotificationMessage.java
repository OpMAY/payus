package com.mvsolutions.payus.response.payus.notification;

import com.mvsolutions.payus.util.NumberUtil;

public class NotificationMessage {
    public static String ReviewWarning(String userName, String content, String storeName) {
        if (content.length() > 4) {
            content = content.substring(0, 4) + "...";
        }
        return userName + "님이 \"" + storeName + "\"에 작성하신 리뷰 \"" + content + "\"에서 다수의 신고가 확인되었습니다.\n확인 부탁드립니다.";
    }

    public static String PointPayback(String userName, String storeName, int point, boolean user) {
        if (user)
            return userName + "님의 " + NumberUtil.PriceFormat(point) + "포인트 페이백이 확인되었습니다.\n\"" + storeName + "\"에 대한 리뷰가 필요합니다!\n리뷰를 작성해주시면 큰 힘이 됩니다.";
        else
            return userName + "님에게" + NumberUtil.PriceFormat(point) + "포인트가 페이백 되었습니다.";
    }

    public static String PointWithdrawRejected(String userName, int point) {
        return userName + "님이 신청하신" + NumberUtil.PriceFormat(point) + "포인트 현금 인출이 반려되었습니다.\n반려 사유를 확인해주세요";
    }

    public static String PointWithdrawApplied(String userName, int point) {
        return userName + "님이 신청하신" + NumberUtil.PriceFormat(point) + "포인트 현금 인출이 승인되었습니다.\n해당 금액은 2~3일 이내에 회원님의 계좌로 입금됩니다.";
    }

    public static String NewStoreEvent(String storeName, int payback_rate) {
        return "\"" + storeName + "\"에서 페이백률 이벤트를 진행중입니다.\n";
    }

    public static String ReviewAnswered(String userName, String content, String storeName) {
        if (content.length() > 4) {
            content = content.substring(0, 4) + "...";
        }
        return userName + "님이 \"" + storeName + "\"에 작성하신 리뷰\"" + content + "\"에 답변이 달렸습니다.";
    }

    public static String VendorPointLackClose(String storeName, int point) {
        return "공급자님의 상점 \"" + storeName + "\"에서 보유한 포인트가 최소 보유 포인트까지 얼마 남지 않았습니다. " +
                "원활한 페이백 이용을 위해 포인트를 미리 충전해주시길 바랍니다. " +
                "보유한 포인트가 10000P 미만일 경우 상점이 어플리케이션에 노출되지 않으며 페이백 이용에 제한이 있을 수 있습니다." +
                "\n현재 보유한 포인트 : " + point + "P";
    }

    public static String VendorPointLack(String storeName, int point) {
        return "공급자님의 상점 \"" + storeName + "\"에서 보유한 포인트가 최소 보유 포인트보다 적습니다. " +
                "원활한 페이백 이용을 위해 포인트를 충전해주시길 바랍니다. " +
                "보유한 포인트가 10000P 미만일 경우 상점이 어플리케이션에 노출되지 않으며 페이백 이용에 제한이 있을 수 있습니다." +
                "\n현재 보유한 포인트 : " + point + "P";
    }


}
