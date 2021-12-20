package com.mvsolutions.payus.restcontroller;

import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.basic.UserNotificationDelete;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserLoginRequest;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserRegisterRequest;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.request.mainpage.MainPageReloadingRequest;
import com.mvsolutions.payus.model.rest.request.mainpage.MainPageRequest;
import com.mvsolutions.payus.model.rest.request.storedetailpage.StoreReportRequest;
import com.mvsolutions.payus.model.rest.request.storedetailpage.UserInsertStoreFavoriteRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorAnswerReviewRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorNotificationDeleteRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorChargeCancelRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointCancelRequest;
import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointChargeRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.*;
import com.mvsolutions.payus.model.rest.response.mainpage.GeoCodeCoordinateRequest;
import com.mvsolutions.payus.service.*;
import com.mvsolutions.payus.util.Constant;
import com.mvsolutions.payus.util.FileUploadUtility;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

@RestController
@Log4j
public class PayUsRestController {
    @Autowired
    private MainPageService mainPageService;

    @Autowired
    private UserService userService;

    @Autowired
    private VendorService vendorService;

    @Autowired
    private NotificationService notificationService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private PointService pointService;

    @Autowired
    private StoreService storeService;

    @Autowired
    private FileUploadUtility fileUploadUtility;

    @Autowired
    private CustomerService customerService;

    /**
     * PreHome#001
     **/
    @RequestMapping(value = "/api/geocode/coordinate", method = RequestMethod.POST)
    public ResponseEntity GetGeoCodeCoordinate(@RequestBody String body) throws JSONException, IOException, URISyntaxException {
        GeoCodeCoordinateRequest request = new Gson().fromJson(body, GeoCodeCoordinateRequest.class);
        return mainPageService.getGeoCodeCoordinates(request);
    }

    /**
     * MainPage#001
     **/
    @RequestMapping(value = "/api/main", method = RequestMethod.GET)
    public ResponseEntity GetMain(@RequestParam("user_no") int user_no,
                                  @RequestParam("address") String address) throws JSONException, IOException, URISyntaxException {
        MainPageRequest request = new MainPageRequest(user_no, address);
        return mainPageService.getMainPage(request);
    }

    /**
     * MainPage#002 - 리로딩
     **/
    @RequestMapping(value = "/api/main/reload", method = RequestMethod.GET)
    public ResponseEntity GetMainReload(@RequestParam("address") String address,
                                        @RequestParam("class_first") int class_first,
                                        @RequestParam("last_index") int last_index) throws JSONException, IOException, URISyntaxException {
        MainPageReloadingRequest request = new MainPageReloadingRequest(address, class_first, last_index);
        return mainPageService.getMainReload(request);
    }

    /**
     * MainPage#003 - 유저 포인트 가져오기.
     */
    @RequestMapping(value = "/api/main/user/point", method = RequestMethod.GET)
    public ResponseEntity GetMainUserPoint(@RequestParam("user_no") int user_no) throws JSONException {
        return mainPageService.getMainUserPoint(user_no);
    }

    /**
     * UserLoginPage#001
     **/
    @RequestMapping(value = "/api/user/login", method = RequestMethod.POST)
    public ResponseEntity LoginUser(@RequestBody String body) throws JSONException {
        UserLoginRequest request = new Gson().fromJson(body, UserLoginRequest.class);
        return userService.loginUser(request);
    }

    /**
     * UserLoginPage#002
     **/
    @RequestMapping(value = "/api/user/register", method = RequestMethod.POST)
    public ResponseEntity RegisterUser(@RequestBody String body) throws JSONException {
        UserRegisterRequest request = new Gson().fromJson(body, UserRegisterRequest.class);
        return userService.registerUser(request);
    }

    /**
     * UserNotification#001
     **/
    @RequestMapping(value = "/api/user/notification", method = RequestMethod.GET)
    public ResponseEntity UserNotification(@RequestParam("user_no") int user_no) throws JSONException {
        return notificationService.getUserNotification(user_no);
    }

    /**
     * UserNotification#002
     **/
    @RequestMapping(value = "/api/user/notification/reload", method = RequestMethod.GET)
    public ResponseEntity UserNotificationReload(@RequestParam("user_no") int user_no,
                                                 @RequestParam("type") int type,
                                                 @RequestParam("last_index") int last_index) throws JSONException {
        return notificationService.getUserNotificationReload(user_no, type, last_index);
    }

    /**
     * UserNotification#003
     */
    @RequestMapping(value = "/api/user/notification/delete", method = RequestMethod.POST)
    public ResponseEntity DeleteUserNotification(@RequestBody String body) {
        UserNotificationDelete request =  new Gson().fromJson(body, UserNotificationDelete.class);
        return notificationService.deleteUserNotification(request);
    }

    /**
     * SupLoginPage#001
     **/
    @RequestMapping(value = "/api/vendor/login", method = RequestMethod.POST)
    public ResponseEntity LoginVendor(@RequestBody String body) throws JSONException {
        VendorLoginRequest request = new Gson().fromJson(body, VendorLoginRequest.class);
        return vendorService.loginVendor(request);
    }

    /**
     * SupHomePage#001
     **/
    @RequestMapping(value = "/api/vendor/home", method = RequestMethod.GET)
    public ResponseEntity VendorHome(@RequestParam("vendor_no") int vendor_no) throws JSONException {
        return vendorService.getVendorHome(vendor_no);
    }

    /**
     * SupNotification#001
     **/
    @RequestMapping(value = "/api/vendor/notification", method = RequestMethod.GET)
    public ResponseEntity VendorNotification(@RequestParam("vendor_no") int vendor_no) throws JSONException {
        return notificationService.getVendorNotification(vendor_no);
    }

    /**
     * SupNotification#002
     **/
    @RequestMapping(value = "/api/vendor/notification/reload", method = RequestMethod.GET)
    public ResponseEntity VendorNotificationReload(@RequestParam("vendor_no") int vendor_no,
                                                   @RequestParam("type") int type,
                                                   @RequestParam("last_index") int last_index) throws JSONException {
        return notificationService.getVendorNotificationReload(vendor_no, type, last_index);
    }

    /**
     * SupNotification#003
     **/
    @RequestMapping(value = "/api/vendor/notification/delete", method = RequestMethod.POST)
    public ResponseEntity DeleteVendorNotification(@RequestBody String body) {
        VendorNotificationDeleteRequest request = new Gson().fromJson(body, VendorNotificationDeleteRequest.class);
        return notificationService.deleteVendorNotification(request);
    }

    /**
     * SupReviewAnswer#001
     **/
    @RequestMapping(value = "/api/vendor/review/content", method = RequestMethod.GET)
    public ResponseEntity GetReviewContentFromNotification(@RequestParam("review_no") int review_no) throws JSONException {
        return reviewService.getReviewContentFromNotification(review_no);
    }

    /**
     * SupReviewAnswer#002
     **/
    @RequestMapping(value = "/api/vendor/review/answer", method = RequestMethod.POST)
    public ResponseEntity AnswerReview(@RequestBody String body) {
        VendorAnswerReviewRequest request = new Gson().fromJson(body, VendorAnswerReviewRequest.class);
        return reviewService.answerReview(request);
    }

    /**
     * SupPointCharge#001
     **/
    @RequestMapping(value = "/api/vendor/point/charge/data", method = RequestMethod.GET)
    public ResponseEntity GetDataForPointCharge(@RequestParam("vendor_no") int vendor_no) throws JSONException {
        return pointService.getDataForPointCharge(vendor_no);
    }

    /**
     * SupPointCharge#002
     **/
    @RequestMapping(value = "/api/vendor/point/charge/request", method = RequestMethod.POST)
    public ResponseEntity ChargeRequestVendorPoint(@RequestBody String body) {
        VendorPointChargeRequest request = new Gson().fromJson(body, VendorPointChargeRequest.class);
        return pointService.chargeRequestVendorPoint(request);
    }

    /**
     * SupPointList#001
     **/
    @RequestMapping(value = "/api/vendor/point/list", method = RequestMethod.GET)
    public ResponseEntity VendorPointListPage(@RequestParam("vendor_no") int vendor_no) throws JSONException {
        return pointService.getVendorPointList(vendor_no);
    }

    /**
     * SupPointList#002
     **/
    @RequestMapping(value = "/api/vendor/point/list/reload", method = RequestMethod.GET)
    public ResponseEntity VendorPointListPageReload(@RequestParam("vendor_no") int vendor_no,
                                                    @RequestParam("last_index") int last_index,
                                                    @RequestParam("reload_type") int reload_type) throws JSONException {
        return pointService.getVendorPointListReload(vendor_no, last_index, reload_type);
    }

    /**
     * SupPointList#003
     **/
    @RequestMapping(value = "/api/vendor/point/list/reject/reason", method = RequestMethod.GET)
    public ResponseEntity VendorPointListRejectReason(@RequestParam("content_no") int content_no,
                                                      @RequestParam("content_type") int content_type) throws JSONException {
        return pointService.getVendorPointRejectReason(content_no, content_type);
    }

    /**
     * SupPointCancel#001
     **/
    @RequestMapping(value = "/api/vendor/point/list/cancel/accumulate", method = RequestMethod.POST)
    public ResponseEntity CancelAccumulatePoint(@RequestBody String body) throws ParseException {
        VendorPointCancelRequest request = new Gson().fromJson(body, VendorPointCancelRequest.class);
        return pointService.cancelAccumulatePoint(request);
    }

    /**
     * SupChargeCancel#001
     **/
    @RequestMapping(value = "/api/vendor/point/list/cancel/charge", method = RequestMethod.POST)
    public ResponseEntity CancelChargePoint(@RequestBody String body) {
        VendorChargeCancelRequest request = new Gson().fromJson(body, VendorChargeCancelRequest.class);
        return pointService.cancelCharge(request);
    }

    /**
     * SupQRPayBack#001 - SupQR, 번호 모두 해당
     **/
    @RequestMapping(value = "/api/vendor/payback/data/user", method = RequestMethod.GET)
    public ResponseEntity GetUserDataForPayback(@RequestParam("user_code") int user_code) throws JSONException {
        return pointService.getUserDataForPayback(user_code);
    }

    /**
     * SupQRPayBack#002
     **/
    @RequestMapping(value = "/api/vendor/payback/data/store", method = RequestMethod.GET)
    public ResponseEntity GetStoreDataForPayback(@RequestParam("vendor_no") int vendor_no) throws JSONException {
        return vendorService.getStorePaybackData(vendor_no);
    }

    /**
     * SupQRPayBack#003
     **/
    @RequestMapping(value = "/api/vendor/payback/request", method = RequestMethod.POST)
    public ResponseEntity RequestPayback(@RequestBody String body) throws JSONException {
        PaybackRequest request = new Gson().fromJson(body, PaybackRequest.class);
        return pointService.requestPayback(request);
    }

    /**
     * UserMyPage#001
     **/
    @RequestMapping(value = "/api/user/mypage", method = RequestMethod.GET)
    public ResponseEntity GetUserMyPageData(@RequestParam("user_no") int user_no) throws JSONException {
        return userService.getUserMyPageData(user_no);
    }

    /**
     * UserCashPage#001
     **/
    @RequestMapping(value = "/api/user/point/withdraw/data", method = RequestMethod.GET)
    public ResponseEntity GetUserPointForWithdrawPage(@RequestParam("user_no") int user_no) throws JSONException {
        return pointService.getUserPointForWithdrawPage(user_no);
    }

    /**
     * UserCashPage#002
     **/
    @RequestMapping(value = "/api/user/point/withdraw/request", method = RequestMethod.POST)
    public ResponseEntity RequestUserPointWithdraw(@RequestBody String body) {
        UserPointWithdrawRequest request = new Gson().fromJson(body, UserPointWithdrawRequest.class);
        return pointService.requestUserPointWithdraw(request);
    }

    /**
     * UserEditPage#001
     **/
    @RequestMapping(value = "/api/user/mypage/data", method = RequestMethod.GET)
    public ResponseEntity GetUserMyPagePersonalData(@RequestParam("user_no") int user_no) throws JSONException {
        return userService.getUserMyPagePersonalData(user_no);
    }

    /**
     * UserEditPage#002
     **/
    @RequestMapping(value = "/api/user/mypage/edit", method = RequestMethod.POST)
    public ResponseEntity EditUserPersonalData(@RequestBody String body) throws JSONException {
        UserPersonalDataEditRequest request = new Gson().fromJson(body, UserPersonalDataEditRequest.class);
        return userService.editUserPersonalData(request);
    }

    /** UserEditPage#003 **/
    @RequestMapping(value = "/api/user/mypage/resign", method = RequestMethod.POST)
    public ResponseEntity UserResign(@RequestBody String body) {
        UserResignRequest request = new Gson().fromJson(body, UserResignRequest.class);
        return userService.resignUser(request);
    }

    /**
     * UserPointPage#001
     **/
    @RequestMapping(value = "/api/user/point/list", method = RequestMethod.GET)
    public ResponseEntity UserPointListPage(@RequestParam("user_no") int user_no) throws JSONException {
        return pointService.getUserPointListPage(user_no);
    }

    /**
     * UserPointPage#002
     **/
    @RequestMapping(value = "/api/user/point/list/reload", method = RequestMethod.GET)
    public ResponseEntity UserPointListPageReload(@RequestParam("user_no") int user_no,
                                                  @RequestParam("last_index") int last_index,
                                                  @RequestParam("reload_type") int reload_type) throws JSONException {
        return pointService.getUserPointListPageReload(user_no, last_index, reload_type);
    }

    /**
     * UserPointReject#001
     **/
    @RequestMapping(value = "/api/user/point/reject/reason", method = RequestMethod.GET)
    public ResponseEntity UserPointRejectReason(@RequestParam("content_type") int content_type,
                                                        @RequestParam("content_no") int content_no) throws JSONException {
        return pointService.getUserPointRejectReason(content_type, content_no);
    }


    /**
     * UserReviewPage#001
     **/
    @RequestMapping(value = "/api/user/point/accumulate/review/predata", method = RequestMethod.GET)
    public ResponseEntity UserReviewPagePreData(@RequestParam("accumulate_no") int accumulate_no) throws JSONException {
        return reviewService.getUserReviewPagePreData(accumulate_no);
    }

    /**
     * UserReviewPage#002
     **/
    @RequestMapping(value = "/api/user/point/accumulate/review/submit", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity UserUploadReview(HttpServletRequest request, @RequestParam("review") String body) throws JSONException, IOException {
        ReviewUploadRequest reviewUploadRequest = new Gson().fromJson(body, ReviewUploadRequest.class);
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        Iterator<String> keys = fileMap.keySet().iterator();
        ArrayList<String> imageList = new ArrayList<>();
        String time = Time.TimeForFile();
        while (keys.hasNext()) {
            String key = keys.next();
            if (key.contains("image")) {
                String path = fileUploadUtility.uploadFile("api/images/review/" + time + "/", fileMap.get(key).getOriginalFilename(), fileMap.get(key).getBytes(), Constant.AWS_SAVE);
                imageList.add("api/images/review/" + time + "/" + path);
            }
        }
        reviewUploadRequest.setImage_list(new Gson().toJson(imageList));
        return reviewService.uploadReview(reviewUploadRequest);
    }

    /**
     * UserReviewCheckPage#001
     **/
    @RequestMapping(value = "/api/user/point/accumulate/review/content", method = RequestMethod.GET)
    public ResponseEntity UserReviewCheck(@RequestParam("accumulate_no") int accumulate_no) throws JSONException {
        return reviewService.getReviewContentFromPointList(accumulate_no);
    }

    /**
     * UserReviewCheckPage#002
     **/
    @RequestMapping(value = "/api/user/point/accumulate/review/delete", method = RequestMethod.POST)
    public ResponseEntity UserReviewDelete(@RequestBody String body) {
        UserReviewDeleteRequest request = new Gson().fromJson(body, UserReviewDeleteRequest.class);
        return reviewService.deleteReviewByUser(request);
    }

    /**
     * UserLikePage#001
     **/
    @RequestMapping(value = "/api/user/favorite", method = RequestMethod.GET)
    public ResponseEntity UserFavoritePage(@RequestParam("user_no") int user_no) throws JSONException {
        return storeService.getUserFavoritePage(user_no);
    }

    /**
     * UserLikePage#002
     **/
    @RequestMapping(value = "/api/user/favorite/reload", method = RequestMethod.GET)
    public ResponseEntity UserFavoritePageReload(@RequestParam("user_no") int user_no,
                                                 @RequestParam("class_first") int class_first,
                                                 @RequestParam("last_index") int last_index) throws JSONException {
        return storeService.getUserFavoritePageReload(user_no, class_first, last_index);
    }

    /**
     * UserLikePage#003
     **/
    @RequestMapping(value = "/api/user/favorite/delete", method = RequestMethod.POST)
    public ResponseEntity DeleteUserFavorite(@RequestBody String body) {
        UserFavoriteDeleteRequest request = new Gson().fromJson(body, UserFavoriteDeleteRequest.class);
        return storeService.deleteUserFavorite(request);
    }

    /**
     * UserReviewListPage#001
     **/
    @RequestMapping(value = "/api/user/review/list", method = RequestMethod.GET)
    public ResponseEntity GetUserReviewList(@RequestParam("user_no") int user_no) throws JSONException {
        return reviewService.getUserReviewList(user_no);
    }

    /**
     * UserReviewListPage#002
     **/
    @RequestMapping(value = "/api/user/review/list/reload", method = RequestMethod.GET)
    public ResponseEntity GetUserReviewListReload(@RequestParam("user_no") int user_no,
                                                  @RequestParam("review_type") int review_type,
                                                  @RequestParam("last_index") int last_index) throws JSONException {
        return reviewService.getUserReviewListReload(user_no, review_type, last_index);
    }

    /**
     * UserReviewListPage#003
     **/
    @RequestMapping(value = "/api/user/review/list/delete", method = RequestMethod.POST)
    public ResponseEntity DeleteUserReview(@RequestBody String body) {
        // UserReviewCheckPage#002 와 동일
        UserReviewDeleteRequest request = new Gson().fromJson(body, UserReviewDeleteRequest.class);
        return reviewService.deleteReviewByUser(request);
    }


    /**
     * UserCustomCenter#001
     **/
    @RequestMapping(value = "/api/user/customcenter", method = RequestMethod.GET)
    public ResponseEntity GetCustomCenterData(@RequestParam("user_no") int user_no) throws JSONException {
        return userService.getCustomCenterData(user_no);
    }

    /**
     * Notice#001
     **/
    @RequestMapping(value = "/api/notice", method = RequestMethod.GET)
    public ResponseEntity GetNoticeList(@RequestParam("last_index") int last_index) throws JSONException {
        return customerService.getNoticeList(last_index);
    }

    /**
     * FAQ#001
     **/
    @RequestMapping(value = "/api/faq", method = RequestMethod.GET)
    public ResponseEntity GetFAQList() throws JSONException {
        return customerService.getFAQList();
    }

    /**
     * UserReportPage#001
     **/
    @RequestMapping(value = "/api/report/list", method = RequestMethod.GET)
    public ResponseEntity GetReportListPage(@RequestParam("user_no") int user_no) throws JSONException {
        return customerService.getReportListPage(user_no);
    }

    /**
     * UserReportPage#002
     **/
    @RequestMapping(value = "/api/report/list/reload", method = RequestMethod.GET)
    public ResponseEntity GetReportListPageReload(@RequestParam("user_no") int user_no,
                                                  @RequestParam("report_status") int report_status,
                                                  @RequestParam("last_index") int last_index) throws JSONException {
        return customerService.getReportListPageReload(user_no, report_status, last_index);
    }

    /**
     * UserReportPage#003
     **/
    @RequestMapping(value = "/api/report/update/click", method = RequestMethod.GET)
    public ResponseEntity GetReportUpdateClick(@RequestParam("report_no") int report_no) throws JSONException {
        return customerService.getReportUpdateClick(report_no);
    }

    /**
     * PayusHome#001
     **/
    @RequestMapping(value = "/api/submain/event", method = RequestMethod.GET)
    public ResponseEntity GetSubMainPageEvents(@RequestParam("address") String address,
                                               @RequestParam("class_first") int class_first) throws IOException, URISyntaxException, JSONException {
        return mainPageService.getSubMainPageEvents(address, class_first);
    }

    /**
     * PayusHome#002
     **/
    @RequestMapping(value = "/api/submain/store", method = RequestMethod.GET)
    public ResponseEntity GetSubMainPageStoreList(@RequestParam("address") String address,
                                                  @RequestParam("class_first") int class_first,
                                                  @RequestParam("order_type") int order_type) throws IOException, URISyntaxException, JSONException {
        return mainPageService.getSubMainPageStoreList(address, class_first, order_type);
    }

    /**
     * PayusHome#003
     **/
    @RequestMapping(value = "/api/submain/store/reload", method = RequestMethod.GET)
    public ResponseEntity GetSubMainPageStoreListReload(@RequestParam("address") String address,
                                                        @RequestParam("class_first") int class_first,
                                                        @RequestParam("class_second") int class_second,
                                                        @RequestParam("order_type") int order_type,
                                                        @RequestParam("last_index") int last_index) throws IOException, URISyntaxException, JSONException {
        return mainPageService.getSubMainPageStoreListReload(address, class_first, class_second, order_type, last_index);
    }

    /**
     * PayusSearchPage#001
     **/
    @RequestMapping(value = "/api/search/keywords", method = RequestMethod.GET)
    public ResponseEntity GetSearchByKeywords(@RequestParam("address") String address,
                                              @RequestParam("keyword") String keyword,
                                              @RequestParam("last_index") int last_index) throws IOException, URISyntaxException, JSONException {
        return mainPageService.searchByKeywords(address, keyword, last_index);
    }

    /**
     * PayusSearchMap#001
     **/
    @RequestMapping(value = "/api/search/map", method = RequestMethod.GET)
    public ResponseEntity GetSearchByMap(@RequestParam("x") double x,
                                         @RequestParam("y") double y) throws JSONException {
        return mainPageService.searchByMap(x, y);
    }

    /**
     * PayusEventPage#001
     **/
    @RequestMapping(value = "/api/store/event", method = RequestMethod.GET)
    public ResponseEntity GetEventPage(@RequestParam("address") String address,
                                       @RequestParam("order_type") int order_type,
                                       @RequestParam("last_index") int last_index,
                                       @RequestParam("class_first") int class_first) throws JSONException, IOException, URISyntaxException {
        return mainPageService.getEventPage(address, order_type, last_index, class_first);
    }


    /**
     * ShopDetailPage#001
     **/
    @RequestMapping(value = "/api/store/detail", method = RequestMethod.GET)
    public ResponseEntity GetStoreDetailPage(@RequestParam("store_no") int store_no,
                                             @RequestParam("user_no") int user_no,
                                             @RequestParam("address") String address) throws IOException, JSONException, URISyntaxException {
        return storeService.getStoreDetailPage(store_no, user_no, address);
    }

    /**
     * ShopDetailPage#002
     **/
    @RequestMapping(value = "/api/store/favorite", method = RequestMethod.POST)
    public ResponseEntity UserSetStoreFavorite(@RequestBody String body) {
        UserInsertStoreFavoriteRequest request = new Gson().fromJson(body, UserInsertStoreFavoriteRequest.class);
        return storeService.userInsertStoreFavorite(request);
    }

    /**
     * ShopReportPage#001
     **/
    @RequestMapping(value = "/api/store/report", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity ReportStore(HttpServletRequest request, @RequestParam("report") String body) throws IOException {
        StoreReportRequest reportRequest = new Gson().fromJson(body, StoreReportRequest.class);
        log.info(body);
        log.info(reportRequest);
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        Iterator<String> keys = fileMap.keySet().iterator();
        ArrayList<String> imageList = new ArrayList<>();
        String time = Time.TimeForFile();
        while (keys.hasNext()) {
            String key = keys.next();
            if (key.contains("image")) {
                log.info("file : " + fileMap.get(key));
                String path = fileUploadUtility.uploadFile("api/images/report/store/" + reportRequest.getStore_no() + "/" + time + "/", fileMap.get(key).getOriginalFilename(), fileMap.get(key).getBytes(), Constant.AWS_SAVE);
                imageList.add("api/images/report/store/" + reportRequest.getStore_no() + "/" + time + "/" + path);
            }
        }
        // 이미지, 등록일자 설정
        reportRequest.setImg_list(new Gson().toJson(imageList));
        reportRequest.setReg_date(Time.TimeFormatHMS());
        return storeService.reportStore(reportRequest);
    }

    /**
     * ShopReviewList#001
     **/
    @RequestMapping(value = "/api/store/review", method = RequestMethod.GET)
    public ResponseEntity GetStoreReviewListPage(@RequestParam("store_no") int store_no,
                                                 @RequestParam("last_index") int last_index) throws JSONException {
        return reviewService.getStoreReviewListPage(store_no, last_index);
    }

    /**
     * PayusQRPage#001
     **/
    @RequestMapping(value = "/api/user/check/accumulate", method = RequestMethod.GET)
    public ResponseEntity UserAccumulateCheck(@RequestParam("user_code") int user_code) throws JSONException {
        return pointService.checkUserAccumulate(user_code);
    }
}
