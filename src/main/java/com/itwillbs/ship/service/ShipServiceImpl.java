package com.itwillbs.ship.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.ship.domain.ShipDTO;

@Repository
public class ShipServiceImpl implements ShipService{

	@Override
	public List<ShipDTO> shipList() {
		System.out.println("ShipServiceImpl shipList()");
		return null;
	}





}