package com.github.kwang2003.hrm.party.service.impl;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.kwang2003.hrm.AbstractTestCase;
import com.github.kwang2003.hrm.framework.common.Result;
import com.github.kwang2003.hrm.party.entity.PartyType;
import com.github.kwang2003.hrm.party.service.PartyTypeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PartyTypeServiceImplTest extends AbstractTestCase{
	@Autowired
	private PartyTypeService partyTypeService;
	@Test
	void testGet() {
		Result<PartyType> result = partyTypeService.get("FAMILY");
		PartyType partyType = result.getPayload();
		assertNotNull(partyType);
		assertEquals(partyType.getId(), "FAMILY");
		assertNotNull(partyType.getCreatedAt());
		assertNotNull(partyType.getUpdatedAt());
		assertEquals(partyType.getDescription(), "家庭");
		log.info("{}",partyType);
	}

}
