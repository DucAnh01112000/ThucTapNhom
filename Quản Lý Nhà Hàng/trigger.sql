
create trigger tgUpdatePhieuYeuCau_Mon
on PHIEUYEUCAU_MON for insert,update
as
begin
	declare @idPYC nchar(50)
	select @idPYC = MaPYC from inserted	
	declare @idBan nchar(50)
	select @idBan = MaBan  from BAN,PHIEUYEUCAU where BAN.MaPYC = @idPYC and PHIEUYEUCAU.MaPYC = BAN.MaPYC and PHIEUYEUCAU.TrangThai = 0 
	
	declare @count int
	select @count = count(*) from PHIEUYEUCAU_MON where MaPYC = @idPYC
	if(@count > 0)
	update BAN set TinhTrang = N'ĐẦY' WHERE MaBan = @idBan
	else
	update BAN set TinhTrang = N'TRỐNG' WHERE MaBan = @idBan
end

go
create trigger tgUpdatePhieuYeuCau
on PHIEUYEUCAU for update
as
begin
	declare @idPYC nchar(50)
	select @idPYC =  MaPYC from inserted
	declare @idBan nchar(50)
	select @idBan = MaBan  from BAN,PHIEUYEUCAU where BAN.MaPYC = @idPYC and PHIEUYEUCAU.MaPYC = BAN.MaPYC 
	declare @count int = 0
	
	select count(*) from PHIEUYEUCAU,BAN where PHIEUYEUCAU.MaPYC = BAN.MaPYC and BAN.MaBan = @idBan and PHIEUYEUCAU.TrangThai = 0
	if(@count = 0)
	update BAN set TinhTrang = N'TRỐNG' where MaBan = @idBan
end



