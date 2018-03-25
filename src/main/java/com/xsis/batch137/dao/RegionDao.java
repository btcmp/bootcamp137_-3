package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.Province;
import com.xsis.batch137.model.Region;

public interface RegionDao {

	public List<Region> selectAll();

	public List<Region> getRegionByProvince(Province province);
}
