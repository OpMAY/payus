package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.storedetailpage.UserInsertStoreFavoriteRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserFavoriteDeleteRequest;
import com.mvsolutions.payus.model.rest.response.usermypage.UserFavoriteListPageResponse;

import java.util.List;

public interface FavoriteMapper {
    List<UserFavoriteListPageResponse> getUserFavorites(int user_no, int class_first);

    boolean checkFavoriteExists(int last_index);

    List<UserFavoriteListPageResponse> getUserFavoritesReload(int user_no, int class_first, int last_index);

    void deleteUserFavorite(UserFavoriteDeleteRequest request);

    boolean checkUserFavoriteStatus(int user_no, int store_no);

    void userInsertStoreFavorite(UserInsertStoreFavoriteRequest request);

    void deleteUserFavoriteByUserAndStoreNo(int user_no, int store_no);
}
