package com.boot.demo.mapper;

import com.boot.demo.model.Artist;
import com.boot.demo.model.ColumnInfo;
import java.util.List;

public interface ArtistMapper {
    List<ColumnInfo> getArtistColumnInfo();

    List<Artist> getArtistList();
}
