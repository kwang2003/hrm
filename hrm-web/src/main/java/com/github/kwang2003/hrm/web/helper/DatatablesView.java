package com.github.kwang2003.hrm.web.helper;

import java.util.List;

public class DatatablesView<T> {
	private List<T> data; // data 与datatales 加载的“dataSrc"对应
	private long recordsTotal;
	private long recordsFiltered;
	private int draw;

	public DatatablesView() {
	}

	public int getDraw() {
		return draw;
	}

	public void setDraw(int draw) {
		this.draw = draw;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public long getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(long recordsTotal) {
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsTotal;
	}

	public long getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(int recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}
}
