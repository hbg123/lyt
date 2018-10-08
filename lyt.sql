-- �����û���
CREATE TABLE IF NOT EXISTS lyt_member(
	mID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- �û�ID
	mName VARCHAR(50) NOT NULL UNIQUE,	-- �ǳ�
	mInfo JSON,						-- �û���Ϣ
	mValidPhone TINYINT NOT NULL DEFAULT 0,	-- �Ƿ��ֻ���֤ 1��֤ 0δ��֤
	mRegdate timestamp NOT NULL,			-- ע��ʱ��
	mDel TINYINT NOT NULL DEFAULT 0 		-- ��ɾ�� 1���� 0����
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- �����ֻ���¼��Ϣ��
CREATE TABLE IF NOT EXISTS lyt_phone_activation(
	mID INT NOT NULL, -- �û�ID
	paNum VARCHAR(20) NOT NULL,	-- �ֻ���
	paSalt CHAR(4) NOT NULL,	-- ����
	paRegdate timestamp NOT NULL, -- ��֤����
	paPW VARCHAR(50) NOT NULL   -- �ֻ���¼����
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ���������û���
CREATE TABLE IF NOT EXISTS lyt_freezing_member(
	mID INT NOT NULL, -- �û�ID
	fmEXP timestamp NOT NULL	-- �������ʱ��
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- �����û�Token��
CREATE TABLE IF NOT EXISTS lyt_member_token(
	mID INT NOT NULL, -- �û�ID
	mtEXP timestamp NOT NULL,	-- ����ʱ��
	mtNBF timestamp NOT NULL,	-- ����ʱ��
	mtIAT timestamp NOT NULL,	-- �䷢ʱ��
	mtRFI JSON NOT NULL			-- ������Ϣ
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- �����˺ŵ�½��Ϣ��
CREATE TABLE IF NOT EXISTS lyt_id_activation(
	mID INT NOT NULL, -- �û�ID
	iaID VARCHAR(30) NOT NULL, 	-- �˺�
	iaSalt CHAR(4) NOT NULL,	-- ����
	iaPW VARCHAR(50) NOT NULL,	-- ��¼����
	iaChangePWDate timestamp NOT NULL	-- ������������
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- �����ܺ�̨����Ա��
CREATE TABLE IF NOT EXISTS lyt_admin_member(
	amID INT NOT NULL,-- �û�ID
	amInfo JSON,	-- ����Ա��Ϣ
	rID INT   		-- ��ɫID
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ������ɫ��
CREATE TABLE IF NOT EXISTS lyt_roll(
	rID INT NOT NULL, -- �û�ID
	rName VARCHAR(20) NOT NULL,	-- ��ɫ��
	rAddTime timestamp DEFAULT CURRENT_TIMESTAMP  ON UPDATE CURRENT_TIMESTAMP, -- ���ʱ��
	rDel TINYINT NOT NULL DEFAULT 0 -- ��ɾ�� 1���� 0����
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ������ɫȨ�ޱ�
CREATE TABLE IF NOT EXISTS lyt_auth_roll(
	amID INT NOT NULL, -- �˵�ID
	rID INT NOT NULL   -- ��ɫID
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- �����ܺ�̨�˵�&���ܱ�
CREATE TABLE IF NOT EXISTS lyt_auth_menu(
	amID INT NOT NULL, -- �˵�ID
	amName VARCHAR(20) NOT NULL, -- ��Ŀ����
	amParentID INT NOT NULL, 	 -- ���˵�ID
	amUrl VARCHAR(255) NOT NULL, -- URL
	amSort TINYINT,				 -- ����
	amModule TINYINT NOT NULL, 	 -- ģ����� 1��Ȩ��&�û�����2����������3����Ʒ����4���˷ѹ���5���������6�����̹���7����Ӫ�
	amActionType TINYINT NOT NULL,-- �������� 1����2��ɾ3����4����
	amHidden TINYINT NOT NULL DEFAULT 1 -- �Ƿ����� 1���� 0����
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ������ס���û���
CREATE TABLE IF NOT EXISTS lyt_shop_member(
	smID INT NOT NULL, -- �û�ID
	smInfo JSON	-- ��פ����ϵ����Ϣ
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ������Ȩ
CREATE TABLE IF NOT EXISTS lyt_auth_shop(
	amID INT NOT NULL, -- �û�ID
	sID INT	-- ����ID
)ENGINE=MyISAM DEFAULT CHARSET=utf8;
