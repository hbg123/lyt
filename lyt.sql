-- 创建用户表
CREATE TABLE IF NOT EXISTS lyt_member(
	mID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- 用户ID
	mName VARCHAR(50) NOT NULL UNIQUE,	-- 昵称
	mInfo JSON,						-- 用户信息
	mValidPhone TINYINT NOT NULL DEFAULT 0,	-- 是否手机认证 1认证 0未认证
	mRegdate timestamp NOT NULL,			-- 注册时间
	mDel TINYINT NOT NULL DEFAULT 0 		-- 软删除 1禁用 0开启
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建手机登录信息表
CREATE TABLE IF NOT EXISTS lyt_phone_activation(
	mID INT NOT NULL, -- 用户ID
	paNum VARCHAR(20) NOT NULL,	-- 手机号
	paSalt CHAR(4) NOT NULL,	-- 盐码
	paRegdate timestamp NOT NULL, -- 验证日期
	paPW VARCHAR(50) NOT NULL   -- 手机登录密码
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建冻结用户表
CREATE TABLE IF NOT EXISTS lyt_freezing_member(
	mID INT NOT NULL, -- 用户ID
	fmEXP timestamp NOT NULL	-- 冻结过期时间
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建用户Token表
CREATE TABLE IF NOT EXISTS lyt_member_token(
	mID INT NOT NULL, -- 用户ID
	mtEXP timestamp NOT NULL,	-- 过期时间
	mtNBF timestamp NOT NULL,	-- 激活时间
	mtIAT timestamp NOT NULL,	-- 颁发时间
	mtRFI JSON NOT NULL			-- 更新信息
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建账号登陆信息表
CREATE TABLE IF NOT EXISTS lyt_id_activation(
	mID INT NOT NULL, -- 用户ID
	iaID VARCHAR(30) NOT NULL, 	-- 账号
	iaSalt CHAR(4) NOT NULL,	-- 盐码
	iaPW VARCHAR(50) NOT NULL,	-- 登录密码
	iaChangePWDate timestamp NOT NULL	-- 更改密码日期
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建总后台管理员表
CREATE TABLE IF NOT EXISTS lyt_admin_member(
	amID INT NOT NULL,-- 用户ID
	amInfo JSON,	-- 管理员信息
	rID INT   		-- 角色ID
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建角色表
CREATE TABLE IF NOT EXISTS lyt_roll(
	rID INT NOT NULL, -- 用户ID
	rName VARCHAR(20) NOT NULL,	-- 角色名
	rAddTime timestamp DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP, -- 添加时间
	rDel TINYINT NOT NULL DEFAULT 0 -- 软删除 1禁用 0开启
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建角色权限表
CREATE TABLE IF NOT EXISTS lyt_auth_roll(
	amID INT NOT NULL, -- 菜单ID
	rID INT NOT NULL   -- 角色ID
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建总后台菜单&功能表
CREATE TABLE IF NOT EXISTS lyt_auth_menu(
	amID INT NOT NULL, -- 菜单ID
	amName VARCHAR(20) NOT NULL, -- 栏目名称
	amParentID INT NOT NULL, 	 -- 父菜单ID
	amUrl VARCHAR(255) NOT NULL, -- URL
	amSort TINYINT,				 -- 排序
	amModule TINYINT NOT NULL, 	 -- 模块分类 1、权限&用户管理2、订单管理3、商品管理、4、运费管理5、财务管理6、店铺管理7、运营活动
	amActionType TINYINT NOT NULL,-- 功能类型 1、增2、删3、改4、查
	amHidden TINYINT NOT NULL DEFAULT 1 -- 是否隐藏 1开启 0隐藏
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 创建入住商用户表
CREATE TABLE IF NOT EXISTS lyt_shop_member(
	smID INT NOT NULL, -- 用户ID
	smInfo JSON	-- 入驻商联系人信息
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 店铺授权
CREATE TABLE IF NOT EXISTS lyt_auth_shop(
	amID INT NOT NULL, -- 用户ID
	sID INT	-- 店铺ID
)ENGINE=MyISAM DEFAULT CHARSET=utf8;
