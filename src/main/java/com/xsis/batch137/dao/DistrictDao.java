package com.xsis.batch137.dao;

import java.util.List;

import com.xsis.batch137.model.District;
import com.xsis.batch137.model.Region;

public interface DistrictDao {

	public List<District> selectAll();

	public List<District> getDistrictByRegion(Region region);
}
