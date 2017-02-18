
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_7msdt_netspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `ms_articles`
--

CREATE TABLE IF NOT EXISTS `ms_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `type` int(11) NOT NULL,
  `anchor` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `title_image` varchar(200) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `image` varchar(200) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `content` longtext CHARACTER SET latin2 COLLATE latin2_czech_cs,
  `parent_article` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `edited_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `ms_articles`
--

INSERT INTO `ms_articles` (`id`, `site`, `type`, `anchor`, `title`, `title_image`, `image`, `content`, `parent_article`, `order`, `date`, `edited_by`) VALUES
(1, 'Kontakty', 0, 0, 'Kontakty', '../www/images/articleLogo/l_contact.png', NULL, NULL, NULL, 1, NULL, NULL),
(2, 'Oznamy', 0, 0, 'Oznamy', '../www/images/articleLogo/l_announc.png', NULL, NULL, NULL, 1, NULL, NULL),
(3, 'Podujatia', 0, 0, 'Podujatia', '../www/images/articleLogo/l_activity.png', NULL, NULL, NULL, 1, NULL, NULL),
(4, 'Kontakty', 0, 1, NULL, '../www/images/articleLogo/l_map.png', NULL, '<iframe width="900" height="450" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=sk&amp;geocode=&amp;q=A.+Bernol%C3%A1ka+%C4%8D.+19,+Detva,+Slovensk%C3%A1+republika&amp;aq=&amp;sll=48.541238,19.413856&amp;sspn=0.002937,0.005375&amp;t=m&amp;ie=UTF8&amp;hq=&amp;hnear=A.+Bernol%C3%A1ka+937%2F19,+962+12+Detva,+Slovensk%C3%A1+republika&amp;ll=48.542353,19.415073&amp;spn=0.006819,0.013733&amp;z=16&amp;output=embed"></iframe>', NULL, 1, NULL, NULL),
(5, 'Onas', 0, 1, 'Trošku o nás', '../www/images/articleLogo/l_about.png', NULL, '<p class="multicol">\r\n                        Materská škola je 5-triedna. Poskytuje celodennú výchovnú starostlivosť deťom od 2 do 6 rokov a deťom s odloženou školskou dochádzkou. MŠ poskytuje deťom možnosť aj poldenného pobytu. Prevádzka je od 6.00 do 16.30 hod. <br/>MŠ je umiestnená v účelovej budove. Prízemie tohto zariadenia tvorí vstupná hala, tri triedy s príslušnými priestormi, miestnosť s príslušenstvom pre prevádzkových pracovníkov, jedáleň a kuchynky s príslušnými priestormi. Na poschodí sú miestnené 2 triedy s príslušnými priestormi, účelové priestory pre personál. V hospodárskom pavilóne sa nachádza kancelária riaditeľky MŠ, vedúcej ŠJ, kuchyňa a práčovňa. <br/>Naša materská škola od roku 2000 pracuje podľa športového projektu pod názvom <span class="bold">Vplyv telovýchovných aktivít na motorický rozvoj detí predškolského veku</span>. Deti pravidelne navštevujú gymnastickú telocvičňu, organizuje sa kurz korčuľovania, kurz lyžovania,škola v prírode a predplavecká príprava. Pani učiteľky tento projekt stále obohacujú o nové a atraktívnejšie činnosti a aktivity.\r\n                    </p>\r\n                    <a href="#" class="tooltip">\r\n                        <img src="images/galery.png" class="photos"/>\r\n                        <span class="photos">Fotky našej škôlky</span>\r\n                    </a>\r\n', NULL, 0, NULL, NULL),
(6, 'Onas', 0, 2, 'Zamestnanci a pani učiteľky', '../www/images/articleLogo/l_personal.png', NULL, '<div class="sub3">\r\n                        <img src="../www/images/personal/i_headmaster.png" class="icon"/>\r\n                        <h2>Pani riaditeľka</h2>\r\n                        <span>Mgr. Katarína Masárová</span>\r\n                    </div>\r\n                    <div class="sub3">\r\n                        <img src="../www/images/personal/i_cooker.png" class="icon"/>\r\n                        <h2>Vedúca školskej jedálne</h2>\r\n                        <span>Jana Pazmányová</span>\r\n                    </div>\r\n                    <div class="sub3">\r\n                        <img src="../www/images/personal/i_money.png" class="icon"/>\r\n                        <h2>Pani hospodárka</h2>\r\n                        <span>Andrea Mihalčíková</span>\r\n                    </div>\r\n                    <div class="sub3">\r\n                        <img src="../www/images/personal/i_23teacher.png" class="icon"/>\r\n                        <h2>Pani učiteľky,<br/>2-3 ročné deti</h2>\r\n                        <span>Ladislava Ruščáková<br/>Anna Strapková</span>\r\n                    </div>\r\n                    <div class="sub3">\r\n                        <img src="../www/images/personal/i_34teacher.png" class="icon"/>\r\n                        <h2>Pani učiteľky,<br/>3-4 ročné deti</h2>\r\n                        <span>Anna Fáberová<br/>Marta Káková</span>\r\n                    </div>\r\n                    <div class="sub3">\r\n                        <img src="../www/images/personal/i_56teacher.png" class="icon"/>\r\n                        <h2>Pani učiteľky,<br/>5-6 ročné deti</h2>\r\n                        <span>Jana Olšiaková<br/>Mgr. Martina Šperková</span>\r\n                    </div>\r\n                    <div class="sub3">\r\n                        <img src="../www/images/personal/i_56teacher.png" class="icon"/>\r\n                        <h2>Pani učiteľky,<br/>5-6 ročné deti a OŠD</h2>\r\n                        <span>Viera Bódiová<br/>Viera Zlatoňová</span>\r\n                    </div>\r\n                    <div class="sub3">\r\n                        <img src="../www/images/personal/i_45teacher.png" class="icon"/>\r\n                        <h2>Pani učiteľky,<br/>4-5 ročné deti</h2>\r\n                        <span>Oľga Poliačiková<br/>p.riad. Mgr. Katarína Masárová</span>\r\n                    </div>\r\n', NULL, 3, NULL, NULL),
(7, 'Onas', 0, 3, 'Aktivity', '../www/images/articleLogo/l_activity.png', NULL, 'Rôzne aktivity a činnosti, ktorých sa vaše deti môžu počas roka zúčastniť.', NULL, 4, NULL, NULL),
(8, 'Onas', 1, 0, 'Gymnastika', NULL, '../www/images/aktivity/gymnastika.png', '<ul>\r\n                        <li>organizovaná 1x týždenne v gymnastickej telocvični</li>\r\n                        <li>rozvoj obratnosti, vestibulárneho a kinestetického aparátu</li>\r\n                        <li>v súvislosti  s vývinovým štádiom pohybových schopností začať u detí rozvíjať športové zručnosti cvičením na náradí (trampolína, kladina, odrazové mostíky, švedske debny, akrobatický štvorec ...)</li>\r\n                        <li>zvýšenú pozornosť venovať akrobatickým cvičeniam a rôznym prekážkovým dráham</li>\r\n                    </ul>\r\n', 7, 9, NULL, NULL),
(10, 'Onas', 2, 0, 'Výuka anglického jazyka', NULL, NULL, '<ul><li>organizovaná 1x-týždenne v MŠ pod vedením Mgr. Martiny Šperkovej</li>\r\n                        <li>deti sa hravou formou oboznamujú s anglickým jazykom</li></ul>\r\n', 7, 6, NULL, NULL),
(11, 'Onas', 1, 0, 'Krúžková činnosť', NULL, '../www/images/aktivity/kruzky.png', '<ul><li>športové karate</li>\r\n<li>mažoretky</li>\r\n                        <li>krúžková činnosť je organizovaná v popoludňajších hodinách 1x týždenne.</li></ul>\r\n', 7, 5, NULL, NULL),
(12, 'Onas', 1, 0, 'Korčuľovanie', NULL, '../www/images/aktivity/korculovanie.png', '<ul><li>organizované v zimnom období 10 hodín na zimnom štadióne v Detve</li>\r\n                        <li>zvládnuť elementárne pohyby na korčuliach a získať základné korčuliarske znalosti</li>\r\n                        <li>rozvoj vôľových vlastností a húževnatosti</li>\r\n                        <li>otužovanie organizmu pohybom v chladnejšom prostredí, zvyšovanie odolnosti organizmu voči chorobám z prechladnutia</li></ul>\r\n', 7, 8, NULL, NULL),
(13, 'Onas', 2, 0, 'Relaxačné cvičenie', NULL, NULL, '<ul><li>organizované 1x týždenne v materskej škole</li>\r\n                        <li>prevencia proti nesprávnemu držaniu tela</li>\r\n                        <li>osvojenie relaxácie, správneho dýchania, duševná rovnováha a koncentrácia</li>\r\n                        <li>výrazné psychomatické pôsobenie a integrujúci činiteľ TV projektu MŠ</li></ul>\r\n', 7, 7, NULL, NULL),
(14, 'Onas', 1, 0, 'Lyžovanie', NULL, '../www/images/aktivity/lyzovanie.png', '<ul><li>organizované v zimnom období</li>\r\n                        <li>lyžovanie je prispôsobené na podmienky materskej školy</li>\r\n                        <li>realizuje sa na školskej záhrade a svahu v blízkosti materskej školy</li>\r\n                        <li>cieľom je osvojiť si základy lyžovania a prekonávať strach z jazdy na lyžiach</li></ul>\r\n', 7, 10, NULL, NULL),
(15, 'Onas', 1, 0, 'Škola v prírode', NULL, '../www/images/aktivity/skola_v_prirode.png', '<ul><li>organizovaná v období máj-jún</li>\r\n                        <li>umožniť deťom pobyt v prírode bez prerušenia výchovno-vzdelávacieho procesu  v zdravotne priaznivom prostredí</li>\r\n                        <li>rozšíriť teoretické a praktické poznatky o prírode priamim pozorovaním</li>\r\n                        <li>zotavovať a upevňovať zdravie a fyzickú zdatnosť detí</li>\r\n                        <li>podporovať vznik detských priateľstiev a základy kolektívneho cítenia</li></ul>\r\n', 7, 11, NULL, NULL),
(16, 'Onas', 1, 0, 'Predplavecká príprava', NULL, '../www/images/aktivity/plavanie.png', '<ul><li>organizovaná v priestoroch školskej záhrady</li>\r\n                        <li>oboznámiť deti s vodou, odstraňovať strach z vody</li>\r\n                        <li>otužovať sa</li></ul>\r\n', 7, 12, NULL, NULL),
(17, 'Onas', 1, 0, 'Enviromentálna výchova', NULL, '../www/images/aktivity/enviro.png', '<ul><li>utvárať základy ekologického cítenia a pozitívneho vzťahu detí k prírode a životnému prostrediu</li>\r\n                        <li>zmeniť u detí a rodičov postoje a hodnotovú orientáciu vo vzťahu k ochrane prírody a životného prostredia</li>\r\n                        <li>aktivity a ekohry z oblasti prírody, vody, odpadu, energie, zdravia</li></ul>\r\n', 7, 13, NULL, NULL),
(18, 'Onas', 0, 4, 'Projekty', '../www/images/articleLogo/l_projects.png', NULL, '<ul>\r\n                        <li><span class="bold">Telovýchovný projekt - Vplyv telovýchovných aktivít na motorický rozvoj detí predškolského veku</span>\r\n                            <ul>\r\n                                <li>pravidelnou pohybovou aktivitou  zvýšiť úroveň telesnej  zdatnosti a pohybovej výkonnosti a podporiť aktívnemu pohybu.</li>\r\n                                <li>organizovanými  pohybovými aktivitami predchádzať respiračným ochoreniam, chorobám pohybového aparátu, obezite a  zapojiť do boja  proti drogám.</li>\r\n                            </ul>\r\n                        </li>\r\n                        <li><span class="bold">Environmentálny projekt - Ekoškôlkarik</span>\r\n                            <ul>\r\n                                <li>ekohrami a aktivitami utvárať základy ekologického cítenia a pozitívneho vzťahu detí k prírode a životnému prostrediu.</li>\r\n                            </ul>\r\n                        </li>\r\n                        <li><span class="bold">Prvé kroky v prevencii drogových závislostí</span>     \r\n                            <ul>\r\n                                <li>eformou divadelných predstavení predchádzať nežiaducim situáciám.</li>\r\n                            </ul>\r\n                        </li>\r\n                        <li><span class="bold">Adamko hravo-zdravo</span>                                                                                  <ul>\r\n                                <li>projekt podpory zdravia</li>\r\n                            </ul>                            \r\n                        </li>\r\n                        <li><span class="bold">Zajko Japi </span>                                                                                          <ul>\r\n                                <li>rozvoj správnej výslovnosti</li>\r\n                            </ul>                                           \r\n                    </ul>\r\n', NULL, 14, NULL, NULL),
(20, 'Zverejnovanie', 0, 0, 'Zmluvy', '../www/images/articleLogo/l_announc.png', NULL, NULL, NULL, 1, NULL, NULL),
(21, 'Zverejnovanie', 0, 1, 'Faktúry', '../www/images/articleLogo/l_announc.png', NULL, NULL, 0, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ms_contact`
--

CREATE TABLE IF NOT EXISTS `ms_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adName` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `street` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `city` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs DEFAULT NULL,
  `content` text CHARACTER SET latin2 COLLATE latin2_czech_cs,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ms_contact`
--

INSERT INTO `ms_contact` (`id`, `adName`, `street`, `city`, `content`) VALUES
(1, 'Materská škola', 'A. Bernoláka č. 19', '962 12 Detva', '<p>Pre každ&yacute; pr&iacute;pad nejak&eacute; ďal&scaron;ie kontaktn&eacute; &uacute;daje:</p>\r\n<p>&nbsp;</p>\r\n<p><strong><span class="bold">Telef&oacute;nne č&iacute;slo:</span> </strong>045 54 55 703</p>\r\n<p><strong>Mobil:</strong> 0902 455 703</p>\r\n<p><span class="bold"><strong>E-mail</strong>:</span> 7msdt@netspace.sk</p>\r\n<p>&nbsp;</p>\r\n<p><span class="bold"><strong>Zriaďovateľ</strong>:</span> Mesto <a href="http://www.detva.sk/">Detva</a>, Tajovsk&eacute;ho č. 7</p>\r\n<p>&nbsp;</p>\r\n<p>Riaditeľ&nbsp;Mgr. Katar&iacute;na Mas&aacute;rov&aacute;</p>');

-- --------------------------------------------------------

--
-- Table structure for table `ms_documents`
--

CREATE TABLE IF NOT EXISTS `ms_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE latin2_czech_cs NOT NULL,
  `file` varchar(100) COLLATE latin2_czech_cs NOT NULL,
  `user` varchar(45) COLLATE latin2_czech_cs DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs AUTO_INCREMENT=39 ;

--
-- Dumping data for table `ms_documents`
--

INSERT INTO `ms_documents` (`id`, `title`, `file`, `user`, `date`, `type`) VALUES
(16, 'Zmluva o dielo,výťahy', '/www/data/zverejnovanie/vytahy.pdf', '7msdt', '2013-12-23 12:16:32', 20),
(15, 'Zmluva o dielo,Bytes, r.s.o.Detva', '/www/data/zverejnovanie/bytes.pdf', '7msdt', '2013-12-23 12:15:51', 20),
(13, 'Zmluva o dielo, Profiwin,s.r.o.', '/www/data/zverejnovanie/okna.pdf', '7msdt', '2013-12-23 12:13:48', 20),
(14, 'Zmluva o dodávke plynu', '/www/data/zverejnovanie/zmluva o dodávke plynu.pdf', '7msdt', '2013-12-23 12:14:42', 20),
(17, 'Zmluva o dodávke tepla', '/www/data/zverejnovanie/teplo.pdf', '7msdt', '2013-12-23 12:17:15', 20),
(18, 'Zmluva o činnosti DDD', '/www/data/zverejnovanie/ddd.pdf', '7msdt', '2013-12-23 12:17:47', 20),
(19, 'Dodatok k zmluve o poskytovaní verejných služ', '/www/data/zverejnovanie/verejne sluzby.pdf', '7msdt', '2013-12-23 12:18:42', 20),
(20, 'Zmluva o vykonávaní bezpečnostnotechnickej sl', '/www/data/zverejnovanie/zmluva o vykonavani bezpec sluzby.pdf', '7msdt', '2013-12-23 12:19:44', 20),
(21, 'Zmluva o dielo, IVeS', '/www/data/zverejnovanie/zmluva o diele IVES.pdf', '7msdt', '2013-12-23 12:20:59', 20),
(22, 'Zmluva o dodávke vody a odvádzaní odpadových ', '/www/data/zverejnovanie/vodarne.pdf', '7msdt', '2013-12-23 12:21:47', 20),
(23, 'Zmluva o združenej dodávke elektriny', '/www/data/zverejnovanie/Zmluva o zdruzenej dodavke elektriny.pdf', '7msdt', '2013-12-23 12:22:30', 20),
(27, 'Uhradené faktúry za rok 2013', '/www/data/zverejnovanie/Uhradené faktúry 2013.pdf', '7msdt', '2014-01-26 20:41:37', 21),
(28, 'Uhradené faktúry za rok 2014', '/www/data/zverejnovanie/Uhradené faktúry rok 2014 Materská škol1.pdf', '7msdt', '2014-05-13 23:49:05', 21),
(29, 'VAVAS s.r.o.', '/www/data/zverejnovanie/Vavas.pdf', '7msdt', '2014-09-10 23:25:14', 21),
(31, 'Stavebné práce Melich', '/www/data/zverejnovanie/Stavebné práce Melich.pdf', '7msdt', '2014-10-15 21:21:25', 21),
(32, 'Marian Ríči MONTARMAT', '/www/data/zverejnovanie/Marian Ríči MONTARMAT.pdf', '7msdt', '2014-10-15 21:28:30', 21),
(33, 'Ekokanál s.r.o.', '/www/data/zverejnovanie/Ekokanál s.r.o..pdf', '7msdt', '2014-10-15 21:30:13', 21),
(34, 'VAVAS s.r.o.', '/www/data/zverejnovanie/VAVAS,s.r.o Plastové okná.pdf', '7msdt', '2014-10-15 21:31:47', 21),
(36, 'EM - LIFT s.r.o.', '/www/data/zverejnovanie/Prehliadka výťahov.pdf', '7msdt', '2014-10-15 21:42:20', 21),
(37, 'Faktúry za rok 2014', '/www/data/zverejnovanie/Faktúry na rok 2014.pdf', '7msdt', '2014-10-21 18:56:32', 21),
(38, 'Zmluva Union', '/www/data/zverejnovanie/Zmluva Union.pdf', '7msdt', '2014-11-04 17:15:21', 20);

-- --------------------------------------------------------

--
-- Table structure for table `ms_elements`
--

CREATE TABLE IF NOT EXISTS `ms_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idArticle` int(11) DEFAULT NULL,
  `idNote` int(11) DEFAULT NULL,
  `idContact` int(11) DEFAULT NULL,
  `idEvent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `ms_elements`
--

INSERT INTO `ms_elements` (`id`, `idArticle`, `idNote`, `idContact`, `idEvent`) VALUES
(1, 1, NULL, 1, NULL),
(97, 3, NULL, NULL, 80),
(12, 2, 4, NULL, NULL),
(94, 3, NULL, NULL, 77),
(11, 2, 3, NULL, NULL),
(98, 3, NULL, NULL, 81),
(58, 2, 9, NULL, NULL),
(96, 3, NULL, NULL, 79),
(95, 3, NULL, NULL, 78),
(92, 3, NULL, NULL, 75),
(91, 3, NULL, NULL, 74),
(93, 3, NULL, NULL, 76),
(89, 3, NULL, NULL, 73),
(88, 3, NULL, NULL, 72),
(87, 3, NULL, NULL, 71),
(85, 3, NULL, NULL, 69),
(83, 3, NULL, NULL, 68),
(82, 3, NULL, NULL, 67),
(86, 3, NULL, NULL, 70),
(81, 3, NULL, NULL, 66),
(80, 3, NULL, NULL, 65),
(78, 3, NULL, NULL, 64),
(76, 3, NULL, NULL, 62),
(73, 3, NULL, NULL, 59),
(75, 3, NULL, NULL, 61),
(74, 3, NULL, NULL, 60),
(99, 3, NULL, NULL, 82),
(72, 3, NULL, NULL, 58),
(71, 2, 13, NULL, NULL),
(100, 3, NULL, NULL, 83),
(101, 3, NULL, NULL, 84),
(102, 3, NULL, NULL, 85),
(103, 3, NULL, NULL, 86),
(104, 3, NULL, NULL, 87),
(105, 3, NULL, NULL, 88),
(106, 3, NULL, NULL, 89),
(107, 3, NULL, NULL, 90),
(108, 3, NULL, NULL, 91),
(109, 3, NULL, NULL, 92),
(111, 2, 18, NULL, NULL),
(112, 3, NULL, NULL, 93),
(113, 3, NULL, NULL, 94),
(114, 3, NULL, NULL, 95);

-- --------------------------------------------------------

--
-- Table structure for table `ms_events`
--

CREATE TABLE IF NOT EXISTS `ms_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `content` text CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `date` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=96 ;

--
-- Dumping data for table `ms_events`
--

INSERT INTO `ms_events` (`id`, `title`, `content`, `date`, `user`) VALUES
(79, 'Bezpečko', '<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:HyphenationZone>21</w:HyphenationZone>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>SK</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Normálna tabuľka";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin-top:0cm;\r\n	mso-para-margin-right:0cm;\r\n	mso-para-margin-bottom:10.0pt;\r\n	mso-para-margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:"Calibri","sans-serif";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-fareast-font-family:"Times New Roman";\r\n	mso-fareast-theme-font:minor-fareast;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;}\r\n</style>\r\n<![endif]-->\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;">V&nbsp;mesiaci apr&iacute;l sa deti z&nbsp;III. triedy so svojimi pani učiteľkami venovali t&yacute;ždňu bezpečnosti a&nbsp;ochrany zdravia. Prostredn&iacute;ctvom milej postavičky ps&iacute;ka &bdquo;Bezpečka&ldquo; sa venovali konkr&eacute;tnym t&eacute;mam:</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;">Doma s&nbsp;Bezpečkom - nebrať do r&uacute;k nebezpečn&eacute; predmety, nesiahať na elektrick&eacute; spotrebiče</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>a&nbsp;z&aacute;suvky, nehrať sa so z&aacute;palkami.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;">Chod&iacute;me bezpečne &ndash; prech&aacute;dzať cez cestu len po priechode pre chodcov, reagovať na<span>&nbsp; </span></span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>červen&eacute; a&nbsp;zelen&eacute; signalizačn&eacute; znamenia.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;">Kde sa nem&aacute;me hrať &ndash; vedieť si pre z&aacute;bavu nach&aacute;dzať bezpečn&eacute; miesta.</span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;">Vodiči, vid&iacute;te n&aacute;s? &ndash; na pracovn&yacute;ch listoch vyfarbovali oblečenie pestr&yacute;mi farbami tak, aby </span></p>\r\n<p class="MsoNormal" style="text-align: justify;"><span style="font-size: 12pt; line-height: 115%;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>ich vodiči dobre videli.</span></p>', '2015-04-27 13:25:11', '7msdt'),
(59, 'Kvety a plody našich záhrad', '<p>Pani učiteľky z III. triedy Viera B&oacute;diov&aacute; a Viera Zlatoňov&aacute; pestuj&uacute; v deťoch vzťah k v&yacute;tvarn&eacute;mu umeniu a svojimi n&aacute;padmi ich vťahuj&uacute; do sveta tvorby. Jeseň pon&uacute;ka jedinečn&eacute; a zauj&iacute;mav&eacute; pr&iacute;rodn&eacute; materi&aacute;ly, ktor&eacute; pani učiteľky využili na v&yacute;robu zauj&iacute;mav&yacute;ch predmetov - mot&yacute;ľ z tekvice, koč&iacute;k z patiz&oacute;nu, detsk&aacute; postavička z ozdobn&yacute;ch tekvičiek a in&eacute;. <br />Svojimi v&yacute;tvormi prispeli k prezent&aacute;cii na&scaron;ej M&Scaron; na v&yacute;stave mesta ,,Kvety a plody na&scaron;ich z&aacute;hrad", odkiaľ si pani učiteľka Martina &Scaron;perkov&aacute; odniesla ocenenie.</p>', '2014-10-21 18:44:51', '7msdt'),
(60, 'Dary jesene', '<p>Deti M&Scaron; prijali pozvanie na v&yacute;stavku ,,Dary jesene", ktor&uacute; pripravili deti a pani učiteľky Martina &Scaron;perkov&aacute; a Jana Ol&scaron;iakov&aacute;. Bolo sa načo pozerať. No najviac sa deťom p&aacute;čil domček pre b&aacute;biky.</p>', '2014-10-19 23:59:26', '7msdt'),
(61, 'Farebný deň', '<p>Dňa 15. 10. 2014 sa uskutočnil v II.triede Žlt&yacute; deň. Počas dňa boli pripraven&eacute; pre deti aktivity, v ktor&yacute;ch spozn&aacute;vali dan&uacute; farbu. Deti pripravovali odtl&aacute;čan&iacute;m listov domček pre ježka, lepili kukuričku Jelku, pom&aacute;hali maliarovi such&yacute;m pastelom dokresliť obr&aacute;zok a v obr&aacute;zkovej knižke, ktor&uacute; si doniesli z domu vyhľad&aacute;vali objekty danej farby. Pribudol ďal&scaron;&iacute; deň a to červen&yacute;, ktor&yacute; sa uskutočnil 3. 12. 2014. Deti si vyr&aacute;bali čižmičky pre Mikul&aacute;&scaron;a, vianočn&eacute; pozdravy pre rodičov a v červen&yacute;ch knih&aacute;ch spozn&aacute;vali rozpr&aacute;vky.</p>\r\n<p><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:HyphenationZone>21</w:HyphenationZone>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n  </w:Compatibility>\r\n  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>\r\n </w:WordDocument>\r\n</xml><![endif]--></p>', '2014-12-08 21:00:56', '7msdt'),
(62, 'Strašidelná hallowenská párty', '<p>V utorok 28.10.2014 sa IV.trieda zmenila na stra&scaron;ideln&uacute; p&aacute;rty, kde nech&yacute;balo veľa prestra&scaron;n&yacute;ch ale z&aacute;roveň prekr&aacute;snych masiek ako napr. ježibaba, pav&uacute;ky, kostlivec, čert a čertica, netopier a niekoľko čarodejn&iacute;c. T&uacute;to čarovn&uacute; atmosf&eacute;ru podfarbili aj čudesn&eacute; zvuky prich&aacute;dzaj&uacute;ce ,,odniekiaľ z nezn&aacute;ma", či svietiace tekvicov&eacute; hlavy. Na&scaron;e mal&eacute; stra&scaron;idielka a pr&iacute;&scaron;erky si okrem promen&aacute;dy po triedach vysk&uacute;&scaron;ali aj množstvo z&aacute;bavn&yacute;ch hier a s&uacute;ťaž&iacute;.</p>', '2014-12-08 21:06:56', '7msdt'),
(64, 'Deti na korčuliach', '<p>Aj v tomto roku sme zrealizovali na zimnom &scaron;tadi&oacute;ne v Detve kurz korčuľovania, ktor&eacute;ho sa z&uacute;častnilo 20 det&iacute;. Za ich odvahu a z&iacute;skan&eacute; zručnosti im bol odovzdan&yacute; diplom a medaila.</p>', '2014-12-08 21:08:05', '7msdt'),
(65, 'Najdlhšia vianočná reťaz', '<p>Dňa 4. 12. 2014 o 10.00 hodine sa v&scaron;etky deti stretli pri stromčeku pred materskou &scaron;kolou, aby si ho vyzdobili farebnou reťazou, ktor&uacute; si vyrobili z plastov&yacute;ch flia&scaron;. Každ&aacute; trieda sa snažila vyrobiť čo najdlh&scaron;iu reťaz, no najdlh&scaron;ia sa podarila deťom pani učiteliek B&oacute;diovej a Zlatoňovej. Deti si pod stromčekom aj zaspievali, zarecitovali a zatancovali. Na z&aacute;ver boli v&scaron;etky deti odmenen&eacute; sladk&yacute;m medovn&iacute;kom.</p>', '2014-12-08 22:01:28', '7msdt'),
(66, 'Mikuláš', '<p style="text-align: center;"><strong>Letia sane maľovan&eacute; na jagavej sanici,</strong></p>\r\n<p style="text-align: center;"><strong>Mikul&aacute;&scaron; sa na nich vezie v ligotavej čapici....</strong></p>\r\n<p>Takto priv&iacute;tali Mikul&aacute;&scaron;a deti z dvoch najmen&scaron;&iacute;ch tried. Cel&eacute; podujatie pripravili pre deti pracovn&iacute;ci <strong>z poisťovne MetLife Amslico.</strong> Mikul&aacute;&scaron; priniesol deťom veľa darčekov, za ktor&eacute; sa poďakovali b&aacute;sničkami a pesničkami. Deťom rozpovedal rozpr&aacute;vku, zahral sa r&ocirc;zne hry i zatancoval.</p>\r\n<p>Do veľk&yacute;ch tried zav&iacute;tal <strong>Mikul&aacute;&scaron; uja Juhasza</strong>, pri&scaron;iel s n&iacute;m aj čert, s ktor&yacute;m si deti dobre za&scaron;antili.</p>\r\n<p>&nbsp;</p>', '2014-12-08 22:03:32', '7msdt'),
(67, 'Pozvánka na vianočnú besiedku', '<p>Dňa 10. 12. 2014 bola V. trieda pozvan&aacute; na besiedku do 4. triedy Z&Scaron; J .J. Thurzu. Vyst&uacute;penie sa deťom p&aacute;čilo a sc&eacute;nky im vyk&uacute;zlili &uacute;smev a niektor&eacute; vtlačili slzu do očiek.</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ďakujeme.</p>', '2014-12-11 20:28:46', '7msdt'),
(68, 'Vianočné vystúpenie', '<p>Dňa 11. 12. 2014 deti V. triedy vyst&uacute;pili s vianočn&yacute;m programom v &Scaron;peci&aacute;lnej Z&Scaron; v Detve a odovzdali im vianočn&eacute; darčeky.</p>', '2014-12-11 20:44:24', '7msdt'),
(69, 'Vôňa Vianoc', '<p>Dňa 16. 12. 2014 z II.triedy sa &scaron;&iacute;rila sladk&aacute; v&ocirc;ňa. V tom čase rodičia s deťmi piekli vianočn&eacute; obl&aacute;tky a zdobili medovn&iacute;čky. Predvianočn&uacute; atmosf&eacute;ru si spr&iacute;jemnili pesničkami, basničkou a r&ocirc;znymi tanečn&yacute;mi hrami.</p>', '2015-01-04 19:38:38', '7msdt'),
(70, 'Muzikant v škôlke', '<p>Počas fa&scaron;iangov&eacute;ho obdobia k n&aacute;m do materskej &scaron;koly zav&iacute;tal zn&aacute;my muzikant a zberateľ ľudov&yacute;ch piesn&iacute; p&aacute;n Anton Budinsk&yacute;, aby deťom z&aacute;bavnou formou predviedol hru na archaick&yacute;ch ľudov&yacute;ch n&aacute;strojoch. Deti jeho talent odmenili potleskom.</p>', '2015-02-03 16:46:14', '7msdt'),
(71, 'Karneval v MŠ', '', '2015-02-26 19:51:49', '7msdt'),
(72, 'Škôlkari dostali nový počítač', '<p>Deťom, ktor&eacute; nav&scaron;tevuj&uacute; na&scaron;u matersk&uacute; &scaron;kolu, koncom febru&aacute;ra firma IBM Slovensko podarovala v porad&iacute; už druh&yacute; detsk&yacute; poč&iacute;tač KidSmart v hodnote 1500&euro;, ktor&eacute;mu sa deti veľmi pote&scaron;ili. Programy v tomto poč&iacute;tači v&yacute;znamne obohatia v&yacute;chovnovzdel&aacute;vac&iacute; proces det&iacute; pred&scaron;kolsk&eacute;ho veku a prispej&uacute; k ich ďal&scaron;iemu osobnostn&eacute;mu rozvoju. Deti a pani učiteľky sa touto cestou chc&uacute; poďakovať firme IBM Slovensko za vz&aacute;cn&yacute; dar.</p>', '2015-02-26 20:59:47', '7msdt'),
(73, 'Kamarátka kniha', '<p>V mesiaci marec už tradične na&scaron;e deti nav&scaron;tevuj&uacute; mestsk&uacute; knižnicu, t&iacute; najmen&scaron;&iacute; zase knižnicu pri Z&aacute;kladnej &scaron;kole J.J.Thurzu. Každ&yacute; si v nej na&scaron;iel t&uacute; svoju - kamar&aacute;tku knihu.</p>\r\n<p>Deti V. triedy s pani uč. Poliačikovou sa dňa 20.3. 2015 z&uacute;častnili VII. ročn&iacute;ka triednej s&uacute;ťaže detskej po&eacute;zie v mestskej knižnici pod n&aacute;zvom: ,,M&aacute;m b&aacute;sničku na jaz&yacute;čku", kde každ&eacute; dieťa prednieslo b&aacute;sničku, za ktor&uacute; boli ocenen&eacute; diplomom i darčekom. Na z&aacute;ver sa naučili HPH ,,Muchotr&aacute;vka".</p>', '2015-03-23 20:11:03', '7msdt'),
(74, 'Šikulkovia', '<p>V r&aacute;mci projektu T&yacute;ždeň otvoren&yacute;ch dver&iacute;, deti 5.triedy s pani uč. Poliačikovou pripravili ku ,,DŇU ZEME" tvoriv&eacute; pr&aacute;ce det&iacute; na t&eacute;mu:</p>\r\n<p>- znečisťovanie a n&aacute;sledne čistenie vody v potokoch, studničk&aacute;ch, jazer&aacute;ch<br />- v&yacute;stava detsk&yacute;ch pr&aacute;c je vystaven&aacute; na 5.M&Scaron; v Detve od 20.4. do 24.4. 2015<br />- detsk&eacute; pr&aacute;ce bud&uacute; vystaven&eacute; aj na Ms&Uacute; v Detve</p>', '2015-04-09 20:47:28', '7msdt'),
(75, 'Etudy z dreva', '<p>&nbsp; Deti III.triedy n&aacute;v&scaron;t&iacute;v&iacute;l&iacute; Podpolianske m&uacute;zeum v Detve, kde bola zrealizovan&aacute; v&yacute;stava dreven&yacute;ch hračiek. Ved&uacute;ca Podpolianskeho m&uacute;zea Mgr. Renata Babicov&aacute; poskytla deťom možnosť vystaven&yacute;mi expon&aacute;tmi sa pohrať. A tak si vysk&uacute;&scaron;ali dreven&yacute; vl&aacute;čik, hojdačku, kon&iacute;ky ale aj dreven&eacute; puzzle kde si vysk&uacute;&scaron;ali zručnosti v skladan&iacute;. Okrem toho mali možnosť pozrieť a vysk&uacute;&scaron;ať dreven&yacute; sala&scaron; aj s pr&iacute;slu&scaron;enstvom, čo sa n&aacute;m veľmi p&aacute;čilo.<br />&nbsp; Najv&auml;č&scaron;&iacute;m z&aacute;žitkom bola cesta do Detvy autobusom, ktor&yacute; n&aacute;m sponzorsky poskytol p. Forg&aacute;č. &nbsp;</p>\r\n<p>Aj deti z V.triedy vr&aacute;mci turistickej vych&aacute;dzky do starej časti Detvy si pozreli v&yacute;stavu hračiek, ktor&uacute; pripravili pre &scaron;irok&uacute; verejnosť Lesy SR &scaron;. p. a Lesn&iacute;cke a drev&aacute;rske m&uacute;zeum Zvolen. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\r\n<p>&nbsp;</p>', '2015-04-20 13:57:26', '7msdt'),
(76, 'Týždeň otvorených dverí na V. MŠ', '<p>V. trieda s pani učiteľkami sa zučastnili na Materskej &scaron;kole, M.R. &Scaron;tef&aacute;nika v Detve podujatia ,, T&yacute;ždeň otvoren&yacute;ch dver&iacute; ku Dňu Zeme, kde si pozreli deťmi hran&eacute; divadielko ,, O stratenej studničke,,, deti si zhotovili ,, rybičku, boli prizvan&iacute; na prezent&aacute;ciu k t&eacute;me: Znečistenie a n&aacute;sledn&eacute; čistenie vody ... v potokoch, studničk&aacute;ch, jazer&aacute;ch, pozreli si v&yacute;stavku pr&aacute;c det&iacute; z matersk&yacute;ch &scaron;k&ocirc;l Detvy na dan&uacute; t&eacute;mu &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>Tento deň bol pre deti veľmi zauj&iacute;mav&yacute; a poučn&yacute;.</p>', '2015-04-26 23:06:30', '7msdt'),
(77, 'Deň Zeme v MŠ', '<p>Dňa 24.4.2015 sa uskutočnilo podujatie Deň Zeme v M&Scaron;. V tento deň pani učiteľky deťom porozpr&aacute;vali o sviatku, ktor&yacute; sa oslavuje na celom svete 22.4. &Scaron;esť det&iacute; z každej triedy zachytilo na&scaron;u kr&aacute;snu pr&iacute;rodu na papieri vo forme ,,kol&aacute;že,, a ostatn&eacute; deti vyčistili od nečist&ocirc;t okolie M&Scaron;, aby sa v ňom dobre c&iacute;tili. V&yacute;stavka spoločn&yacute;ch pr&aacute;c det&iacute; bola spr&iacute;stupnen&aacute; aj rodičom a priateľom M&Scaron;.</p>', '2015-04-26 23:40:33', '7msdt');
INSERT INTO `ms_events` (`id`, `title`, `content`, `date`, `user`) VALUES
(78, 'Projekt ,,Lienka Lenka,,', '<!--[if gte mso 9]><xml>\r\n <o:OfficeDocumentSettings>\r\n  <o:RelyOnVML/>\r\n  <o:AllowPNG/>\r\n </o:OfficeDocumentSettings>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:WordDocument>\r\n  <w:View>Normal</w:View>\r\n  <w:Zoom>0</w:Zoom>\r\n  <w:TrackMoves/>\r\n  <w:TrackFormatting/>\r\n  <w:HyphenationZone>21</w:HyphenationZone>\r\n  <w:PunctuationKerning/>\r\n  <w:ValidateAgainstSchemas/>\r\n  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>\r\n  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>\r\n  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>\r\n  <w:DoNotPromoteQF/>\r\n  <w:LidThemeOther>SK</w:LidThemeOther>\r\n  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>\r\n  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>\r\n  <w:Compatibility>\r\n   <w:BreakWrappedTables/>\r\n   <w:SnapToGridInCell/>\r\n   <w:WrapTextWithPunct/>\r\n   <w:UseAsianBreakRules/>\r\n   <w:DontGrowAutofit/>\r\n   <w:SplitPgBreakAndParaMark/>\r\n   <w:DontVertAlignCellWithSp/>\r\n   <w:DontBreakConstrainedForcedTables/>\r\n   <w:DontVertAlignInTxbx/>\r\n   <w:Word11KerningPairs/>\r\n   <w:CachedColBalance/>\r\n  </w:Compatibility>\r\n  <m:mathPr>\r\n   <m:mathFont m:val="Cambria Math"/>\r\n   <m:brkBin m:val="before"/>\r\n   <m:brkBinSub m:val="--"/>\r\n   <m:smallFrac m:val="off"/>\r\n   <m:dispDef/>\r\n   <m:lMargin m:val="0"/>\r\n   <m:rMargin m:val="0"/>\r\n   <m:defJc m:val="centerGroup"/>\r\n   <m:wrapIndent m:val="1440"/>\r\n   <m:intLim m:val="subSup"/>\r\n   <m:naryLim m:val="undOvr"/>\r\n  </m:mathPr></w:WordDocument>\r\n</xml><![endif]--><!--[if gte mso 9]><xml>\r\n <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"\r\n  DefSemiHidden="true" DefQFormat="false" DefPriority="99"\r\n  LatentStyleCount="267">\r\n  <w:LsdException Locked="false" Priority="0" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>\r\n  <w:LsdException Locked="false" Priority="9" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>\r\n  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>\r\n  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>\r\n  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>\r\n  <w:LsdException Locked="false" Priority="10" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Title"/>\r\n  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>\r\n  <w:LsdException Locked="false" Priority="11" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>\r\n  <w:LsdException Locked="false" Priority="22" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>\r\n  <w:LsdException Locked="false" Priority="20" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="59" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Table Grid"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>\r\n  <w:LsdException Locked="false" Priority="1" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>\r\n  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>\r\n  <w:LsdException Locked="false" Priority="34" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>\r\n  <w:LsdException Locked="false" Priority="29" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>\r\n  <w:LsdException Locked="false" Priority="30" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>\r\n  <w:LsdException Locked="false" Priority="60" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="61" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="62" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="63" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="64" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="65" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="66" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="67" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="68" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="69" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="70" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Dark List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="71" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="72" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="73" SemiHidden="false"\r\n   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>\r\n  <w:LsdException Locked="false" Priority="19" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="21" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>\r\n  <w:LsdException Locked="false" Priority="31" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>\r\n  <w:LsdException Locked="false" Priority="32" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>\r\n  <w:LsdException Locked="false" Priority="33" SemiHidden="false"\r\n   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>\r\n  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>\r\n  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>\r\n </w:LatentStyles>\r\n</xml><![endif]--><!--[if gte mso 10]>\r\n<style>\r\n /* Style Definitions */\r\n table.MsoNormalTable\r\n	{mso-style-name:"Normálna tabuľka";\r\n	mso-tstyle-rowband-size:0;\r\n	mso-tstyle-colband-size:0;\r\n	mso-style-noshow:yes;\r\n	mso-style-priority:99;\r\n	mso-style-qformat:yes;\r\n	mso-style-parent:"";\r\n	mso-padding-alt:0cm 5.4pt 0cm 5.4pt;\r\n	mso-para-margin-top:0cm;\r\n	mso-para-margin-right:0cm;\r\n	mso-para-margin-bottom:10.0pt;\r\n	mso-para-margin-left:0cm;\r\n	line-height:115%;\r\n	mso-pagination:widow-orphan;\r\n	font-size:11.0pt;\r\n	font-family:"Calibri","sans-serif";\r\n	mso-ascii-font-family:Calibri;\r\n	mso-ascii-theme-font:minor-latin;\r\n	mso-fareast-font-family:"Times New Roman";\r\n	mso-fareast-theme-font:minor-fareast;\r\n	mso-hansi-font-family:Calibri;\r\n	mso-hansi-theme-font:minor-latin;}\r\n</style>\r\n<![endif]-->\r\n<p class="MsoNormal"><span style="font-size: 12pt; line-height: 115%;">S&uacute;časťou v&yacute;chovno-vzdel&aacute;vacieho procesu det&iacute; III. triedy je plnenie environment&aacute;lneho projektu &bdquo;Pr&iacute;behy Lienky Lenky&ldquo;. </span></p>\r\n<p class="MsoNormal"><span style="font-size: 12pt; line-height: 115%;">Prostredn&iacute;ctvom jedn&eacute;ho z&nbsp;pr&iacute;behov &bdquo;Ako Lienka Lenka spoznala nov&yacute;ch kamar&aacute;tov&ldquo; sa deti zozn&aacute;mili s&nbsp;pestrosťou života pod zemou, na zemi a&nbsp;nad zemou.</span></p>\r\n<p class="MsoNormal"><span style="font-size: 12pt; line-height: 115%;">Potom spoločne vyfarbili pekn&eacute; plag&aacute;ty o&nbsp;pr&iacute;rode, ktor&eacute; priniesli do &scaron;k&ocirc;lky sestry Kamilka a&nbsp;Nelka Kucejov&eacute;.</span></p>', '2015-04-27 13:04:22', '7msdt'),
(58, 'Krása ukrytá v jesenných plodoch', '<p>V polovici okt&oacute;bra pani učiteľky Poliačikov&aacute; a Mas&aacute;rov&aacute; z 5 triedy pripravili&nbsp; spolu s rodičmi a deťmi v&yacute;stavku ,,Kr&aacute;sa ukryt&aacute; v jesenn&yacute;ch plodoch". Deti využili dostupn&yacute; pr&iacute;rodn&yacute; materi&aacute;l a spolu s rodičmi, s&uacute;rodencami a pani uč. vyrobili kr&aacute;sne , zauj&iacute;mav&eacute; a p&uacute;tav&eacute; v&yacute;tvory.&nbsp;Svojimi v&yacute;tvormi predsvedčili aj svojich kamar&aacute;tov, ktor&iacute; sa na v&yacute;stavku pri&scaron;li pozrieť a nabrať si tak in&scaron;pir&aacute;ciu pri tvoren&iacute; r&ocirc;znych v&yacute;robkov.</p>', '2014-10-19 23:15:02', '7msdt'),
(80, 'Pozvanie mamičiek do divadla', '<p>Aj tento rok si deti pripravili prekvapenie na <strong><em>,,Deň matiek"</em></strong> a pozvali svoje mamičky do KD A. Sl&aacute;dkoviča, dňa<span style="color: #ff0000;"> 3.5.2015</span> na divadeln&uacute; rozpr&aacute;vku <strong>,,Tri prasiatka"</strong>. Takto sa im chceli poďakovať za ich starostlivosť a za spoločn&eacute; a pr&iacute;jemne str&aacute;ven&eacute; popoludnie.&nbsp;</p>\r\n<p>Ďakujeme v&scaron;etk&yacute;m mamičk&aacute;m, že sa z&uacute;častnili na kulr&uacute;rnom podujat&iacute; so svoj&iacute;m&iacute; deťmi.</p>\r\n<p style="text-align: center;"><em>Ako dobre, moja mama,</em></p>\r\n<p style="text-align: center;"><em>&nbsp; &nbsp; &nbsp;že ťa m&aacute;m a nie som sama,</em></p>\r\n<p style="text-align: center;"><em>že ma berie&scaron; do n&aacute;ručia,</em></p>\r\n<p style="text-align: center;"><em>ako kvietky, ktor&eacute; pučia.</em></p>\r\n<p style="text-align: center;">Želaj&uacute;</p>\r\n<p style="text-align: center;"><strong> deti V.triedy s pani učiteľkami Poliačikov&aacute; a Mas&aacute;rov&aacute;</strong></p>', '2015-05-06 13:09:40', '7msdt'),
(81, 'Beh zdravia na III. ZŠ', '<p>Dňa 6. 5. 2015 sa deti V.triedy z&uacute;častnili &scaron;portovej aktivity ,,Behu zdravia" ktor&uacute; pripravila III.Z&Scaron; za &uacute;čelom - Spojme srdcia pre zdravie.</p>\r\n<p>- deti odbehli okruh okolo Z&Scaron;</p>\r\n<p>- dostali odznak zdatnosti ...</p>\r\n<p>- a občerstvili sa ovoc&iacute;m</p>\r\n<p>Akcia sa deťom veľmi p&aacute;čila.</p>', '2015-05-06 20:48:57', '7msdt'),
(82, 'Malí záchranári na MŠ, Nám. SNP Detva', '<p>Dňa <strong>12.5.2015</strong> sa deti z 5. triedy: Kuric,Chamuti,Vilhanček, Purdekov&aacute;, Paučov&aacute;, N&ocirc;ta z&uacute;častnili <strong>6. ročn&iacute;ka</strong> z&aacute;chran&aacute;rskej s&uacute;ťaži <em><strong>"Mal&iacute; z&aacute;chran&aacute;ri"</strong></em>, ktor&aacute; sa poriadala v M&Scaron; - N&aacute;m. SNP v Detve. Deti s&uacute;ťažili v discipl&iacute;nach:</p>\r\n<p>&nbsp;- bicyklovanie sa a re&scaron;pektovanie a pozn&aacute;vanie dopr. značiek,</p>\r\n<p>&nbsp;- vyliezli na horolezeck&uacute; strnu a poskladali dopr. značku z puzzl&iacute;</p>\r\n<p>&nbsp;- pohybom auta sa mali dostať do cieľa</p>\r\n<p>&nbsp;- spr&aacute;vne priradiť obr&aacute;zky, ktor&eacute; patria na chodn&iacute;k a na cestu &nbsp;&nbsp;</p>\r\n<p>Na &uacute;vod s&uacute;žaže deti prekvapili policajti na aut&aacute;ch, psovodi, ktor&iacute; uk&aacute;zali a porozpr&aacute;vali deťom o tom ako pracuj&uacute; - hľadaj&uacute; p&aacute;chateľov, čo m&ocirc;žu pri pr&aacute;ci použiť a psovodi uk&aacute;zali v&yacute;cvik svojich ps&iacute;kov, ale aj to ako sa musia o nich starať.</p>\r\n<p>p.uč. Poliačikov&aacute;</p>\r\n<p>&nbsp;</p>', '2015-05-14 13:07:10', '7msdt'),
(84, 'Deň matiek', '<p>Oslava Deň matiek prebiehala na M&Scaron; r&ocirc;zne. T&iacute; najmen&scaron;&iacute; pre svoje mamičky pripravili darček s kr&aacute;tkou b&aacute;sničkou, t&iacute; star&scaron;&iacute; pozvali do &scaron;kolskej z&aacute;hrady mamičky a spoločne si zhotovili srdiečka, pote&scaron;ili kr&aacute;tkym programom a posedeli pri sl&aacute;vnostnom stole. A t&iacute; najstar&scaron;&iacute; pozvali mamičky na besiedku s bohat&yacute;m programom pln&yacute; b&aacute;sničiek, pesničiek, sc&eacute;nok a tančekov.&nbsp;</p>', '2015-05-19 12:47:01', '7msdt'),
(83, 'Divadielko v školskej záhrade', '<p>Dňa <strong>13. 5. 2015</strong> kr&aacute;sne slnečn&eacute; počasie umožnilo hercom zahrať deťom divadielko netradične - vonku, v &scaron;kolskej z&aacute;hrade. Hereck&eacute; umenie a ich kreativita zabavila v&scaron;etkych pr&iacute;tomn&yacute;ch. &Uacute;lohu herca si vysk&uacute;&scaron;ali aj deti z na&scaron;ej &scaron;k&ocirc;lky Elizabethka a Milanko. Ako sa volalo to divadlo ?<em><span style="color: #ff0000;"><strong> Ako sa Matesko oženil</strong></span></em></p>', '2015-05-14 13:09:38', '7msdt'),
(85, 'Športová olympiáda materských škôl Detvy', '<p>Dňa 28. 5. 2015 o 9.00 hod. sa &scaron;tyri matersk&eacute; &scaron;koly Detvy zi&scaron;li na IX. ročn&iacute;ku &scaron;portovej olympi&aacute;dy. S&uacute;ťažilo sa v styroch discipl&iacute;nach - jazda na odr&aacute;žadle, trojskok znožmo z miesta, hod do ko&scaron;a a prek&aacute;žkov&aacute; dr&aacute;ha. Pre t&yacute;ch čo pri&scaron;li povzbudzovať, boli pripraven&eacute; z&aacute;bavn&eacute; hry. Počas olympi&aacute;dy vyst&uacute;pili mažoretky, gymnastky zo &scaron;portov&eacute;ho gymnastick&eacute;ho oddielu Detva a mlad&iacute; karateristi pr&iacute;pravka. V z&aacute;vere sa predstavili dievčat&aacute; z M&Scaron; s ľudov&yacute;m tancom.</p>\r\n<p><a href="data/others/erb na zverejnenie.png">Toto podujatie bolo spolufinancovan&eacute; z rozpočtu mesta Detva - tu</a></p>', '2015-06-16 00:06:53', '7msdt'),
(86, 'ZUŠ a Rozprávková ríša', '<p>Na&scaron;e deti prijali pozvanie ZU&Scaron; v Detve na Deň otvoren&yacute;ch dver&iacute; pod n&aacute;zvom Rozpr&aacute;vkov&aacute; r&iacute;&scaron;a. Deťom sa v nej p&aacute;čilo.</p>', '2015-05-30 22:41:07', '7msdt'),
(87, 'Šikulkovia sa zabávali', '<p>Pekn&yacute; deň zažili deti a rodičia v popoludn&iacute; 1. j&uacute;na na &scaron;kolskej z&aacute;hrade M&Scaron;. Boli pre v&scaron;etk&yacute;ch pripraven&eacute; pohybov&eacute; aktivity a z&aacute;bavn&eacute; hry. No najviac mali radosť zo &scaron;a&scaron;a, ktor&yacute; deťom k&uacute;zlil zvieratk&aacute; z bal&oacute;nikov.</p>', '2015-06-04 13:27:22', '7msdt'),
(88, 'Čiernohronská železnička', '<p>Dňa 2. 6. 2015 sme sa boli previesť na historickom vl&aacute;čiku v Čiernom Balogu. Bol to v&yacute;let &scaron;it&yacute; na mieru. Prečo? &nbsp;Počasie ide&aacute;lne, spokojnosť u det&iacute; i rodičov a pekne str&aacute;ven&yacute; deň.&nbsp;</p>', '2015-06-04 13:28:28', '7msdt'),
(89, 'Overovačka', '<p>V. trieda ukončila v r&aacute;mci projektu M&Scaron; SR telov&yacute;chovn&yacute; projekt, ktor&eacute;ho ciele sme plnili počas cel&eacute;ho &scaron;k.roku. Aj gymnastika, ktor&uacute; sme nav&scaron;tevovali na III. Z&Scaron;, ukončili deti &scaron;portov&yacute;mi aktivitami a zmerali si sily s kamar&aacute;tmi z inej M&Scaron;, dňa 4. 6. 2015.</p>\r\n<p>nap&iacute;sala:p.uč. Poliačikov&aacute;</p>', '2015-06-04 22:04:49', '7msdt'),
(90, 'Detvianske škôlkove slávnosti', '<p>Na&scaron;a M&Scaron; a deti pred&scaron;kolsk&yacute;ch tried si pripravili ľudov&yacute; tanček a ľudov&eacute; pesničky na s&uacute;ťaž pod n&aacute;zvom: <em><strong>Detvianske &scaron;k&ocirc;lkove</strong></em><strong> sl&aacute;vnosti,&nbsp;</strong>ktor&eacute; sa konali 3. 6. 2015 v DK A. Sl&aacute;dkoviča v Detve. Tieto sl&aacute;vnosti zorganizovala M&Scaron;, N&aacute;m.SNP Detva. Deti pripravili na s&uacute;ťaž pani uč. Poliačikov&aacute; a Ru&scaron;č&aacute;kov&aacute;. Na&scaron;u M&Scaron; reprezentovali deti: Ciglanov&aacute;, Melichov&aacute;, Purdekov&aacute;, Paučov&aacute;,Barab&aacute;&scaron;ov&aacute;, Janč&iacute;chov&aacute;, Spodniakov&aacute; a Baumanov&aacute;.<em><br /></em></p>\r\n<p>nap&iacute;sala: pani.uč. Poliačikov&aacute;</p>', '2015-06-04 21:54:04', '7msdt'),
(91, 'Divadielko včielka Želka a bublinkovanie', '<p>V r&aacute;mci projektu "Prv&eacute; kroky v prevencii drogov&yacute;ch z&aacute;vislost&iacute;" si pani uč. Poliačikov&aacute; a pani riad. Mgr. Mas&aacute;rov&aacute; pripravili pre deti dňa 4. 6. 2015 divadielka k danej t&eacute;me, aby deťom takto pribl&iacute;žili v&yacute;znam z&aacute;vislost&iacute; a to:</p>\r\n<p>- viesť deti k rozli&scaron;ovaniu vhodn&yacute;ch a nevhodn&yacute;ch n&aacute;pojov pre svoje zdravie ,,Alkohol" Včielka Želka a pivn&yacute; poh&aacute;r.</p>\r\n<p>- viesť deti k spr&aacute;vnemu a uvedomel&eacute;mu d&yacute;chaniu, poznať v&yacute;znam vzduchu pre život ,,Fajčenie" Ako včielka Želka zachraňovala les.</p>\r\n<p>Tento projekt bol spolufinancovan&yacute; z rozpočtu mesta Detva -<a href="data/others/(1)erb%20na zverejnenie.png"><span style="color: #ff0000;"> tu</span></a></p>\r\n<p>Po divadielku pani uč. &Scaron;perkov&aacute; pozvala deti na bublinkovanie. Predviedla deťom r&ocirc;zne sp&ocirc;soby tvorenia bubl&iacute;n, veď sa pozrite... ak&aacute; kr&aacute;sa.</p>\r\n<p>nap&iacute;sala pani.uč. Poliačikov&aacute;</p>', '2015-06-16 00:09:51', '7msdt'),
(92, 'Výlet na Košútku', '<p><strong>Dňa 5. 6. 2015</strong> prežili deti III. triedy kr&aacute;sne dopoludnie v &scaron;portovo - rekreačnom are&aacute;li <strong>,,Ko&scaron;&uacute;tka" pri Hriňovej</strong>. V prostred&iacute; peknej pr&iacute;rody sa dos&yacute;ta vy&scaron;antili na trampol&iacute;nach, ,,sk&aacute;kacej žirafe" a lezeckej stene.&nbsp;&nbsp;&nbsp;&nbsp; Z v&yacute;letu odch&aacute;dzali nad&scaron;en&iacute; a pln&iacute; z&aacute;žitkov.<br />Na&scaron;e poďakovanie patr&iacute; p&aacute;novi Hanesovi, ktor&yacute; n&aacute;s cel&eacute; dopoludnie sprev&aacute;dzal a p&aacute;novi Forg&aacute;čovi za zabezpečenie autobusovej dopravy. A čo povedali deti? ......<strong>" bolo riadne dobre"</strong></p>', '2015-06-10 20:57:06', '7msdt'),
(93, 'Týždeň v prírode', '<p>&nbsp; &nbsp;Pani uč. Poliačikov&aacute; a pani riad. Mas&aacute;rov&aacute; pre deti 5. triedy na cel&yacute; t&yacute;ždeň pripravili turistick&eacute; vych&aacute;dzky do pr&iacute;rody v okol&iacute; Detvy. Deti každ&yacute; deň spozn&aacute;vali pr&iacute;rodn&eacute; kr&aacute;sy, utv&aacute;rali sme tak v nich citov&yacute; vzťah k živej a neživej pr&iacute;rode ako aj z&aacute;klady enviroment&aacute;lneho c&iacute;tenia. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Z&aacute;žitkov&yacute;m učen&iacute;m deti viedli k tomu,aby boli citlivej&scaron;ie voči prejavom ohrozenia alebo ničenia pr&iacute;rody a aby pr&iacute;rodu ochraňovali ako d&ocirc;ležit&uacute; s&uacute;časť ŽP.</p>\r\n<p style="text-align: left;">1. deň - Kamenolom, kl&aacute;&scaron;tor</p>\r\n<p style="text-align: left;">2. deň - Roľn&iacute;cke družstvo Detva</p>\r\n<p style="text-align: left;">3. deň -Železničn&aacute; stanica, rieka Slatina</p>\r\n<p style="text-align: left;">4. deň - Detvianske k&uacute;palisko, n&aacute;m.SNP</p>\r\n<p style="text-align: left;">5. deň - Ranč v zelenom &uacute;dol&iacute;, Dolinky</p>\r\n<p style="text-align: left;">Nap&iacute;sala: Poliačiko&aacute;</p>', '2015-06-17 12:53:32', '7msdt'),
(94, 'Týždeň v prírode', '<p>&nbsp; &nbsp;Pani uč. Poliačikov&aacute; a pani riad. Mas&aacute;rov&aacute; pre deti 5. triedy na cel&yacute; t&yacute;ždeň pripravili turistick&eacute; vych&aacute;dzky do pr&iacute;rody v okol&iacute; Detvy. Deti každ&yacute; deň spozn&aacute;vali pr&iacute;rodn&eacute; kr&aacute;sy, utv&aacute;rali sme tak v nich citov&yacute; vzťah k živej a neživej pr&iacute;rode ako aj z&aacute;klady enviroment&aacute;lneho c&iacute;tenia. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Z&aacute;žitkov&yacute;m učen&iacute;m deti viedli k tomu,aby boli citlivej&scaron;ie voči prejavom ohrozenia alebo ničenia pr&iacute;rody a aby pr&iacute;rodu ochraňovali ako d&ocirc;ležit&uacute; s&uacute;časť ŽP.</p>\r\n<p style="text-align: left;">1. deň - Kamenolom, kl&aacute;&scaron;tor</p>\r\n<p style="text-align: left;">2. deň - Roľn&iacute;cke družstvo Detva</p>\r\n<p style="text-align: left;">3. deň -Železničn&aacute; stanica, rieka Slatina</p>\r\n<p style="text-align: left;">4. deň - Detvianske k&uacute;palisko, n&aacute;m.SNP</p>\r\n<p style="text-align: left;">5. deň - Ranč v zelenom &uacute;dol&iacute;, Dolinky</p>\r\n<p style="text-align: left;">Nap&iacute;sala: Poliačiko&aacute;</p>', '2015-06-17 13:05:28', '7msdt'),
(95, 'Zvolenský zámok', '<p>Je čas v&yacute;letov a deti V.triedy sa rozhodli nav&scaron;t&iacute;viť Zvolensk&yacute; z&aacute;mok. Priv&iacute;tali ich tam lektorky, ktor&eacute; &nbsp;z&aacute;bavnou formou deťom uk&aacute;zali obraz&aacute;reň Zvolensk&eacute;ho z&aacute;mku. V&yacute;let sa deťom p&aacute;čil a už dnes sa dohodli, že najbliž&scaron;ie nav&scaron;t&iacute;via V&iacute;gľa&scaron;sk&yacute; z&aacute;mok, ktor&yacute; ned&aacute;vno zrekon&scaron;truovali.</p>', '2015-06-19 14:16:38', '7msdt');

-- --------------------------------------------------------

--
-- Table structure for table `ms_gallery`
--

CREATE TABLE IF NOT EXISTS `ms_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) COLLATE latin2_czech_cs NOT NULL,
  `thumb` varchar(100) COLLATE latin2_czech_cs NOT NULL,
  `idEvent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin2 COLLATE=latin2_czech_cs AUTO_INCREMENT=365 ;

--
-- Dumping data for table `ms_gallery`
--

INSERT INTO `ms_gallery` (`id`, `file`, `thumb`, `idEvent`) VALUES
(230, 'data/gallery/20150205_102333.jpg', 'data/gallery/thumbs/20150205_102333.jpg', 71),
(231, 'data/gallery/Karneval 2015, III. trieda 033.jpg', 'data/gallery/thumbs/Karneval 2015, III. trieda 033.jpg', 71),
(235, 'data/gallery/Karneval 2015, III. trieda 121.jpg', 'data/gallery/thumbs/Karneval 2015, III. trieda 121.jpg', 71),
(249, 'data/gallery/SAM_7390.JPG', 'data/gallery/thumbs/SAM_7390.JPG', 74),
(248, 'data/gallery/SAM_7388.JPG', 'data/gallery/thumbs/SAM_7388.JPG', 74),
(247, 'data/gallery/SAM_7387.JPG', 'data/gallery/thumbs/SAM_7387.JPG', 74),
(246, 'data/gallery/SAM_7385.JPG', 'data/gallery/thumbs/SAM_7385.JPG', 74),
(242, 'data/gallery/SAM_7381.JPG', 'data/gallery/thumbs/SAM_7381.JPG', 73),
(241, 'data/gallery/DSCF0670.JPG', 'data/gallery/thumbs/DSCF0670.JPG', 73),
(240, 'data/gallery/DSCF0666.JPG', 'data/gallery/thumbs/DSCF0666.JPG', 73),
(236, 'data/gallery/SAM_7260.JPG', 'data/gallery/thumbs/SAM_7260.JPG', 71),
(237, 'data/gallery/SAM_7353.JPG', 'data/gallery/thumbs/SAM_7353.JPG', 72),
(238, 'data/gallery/SAM_7354.JPG', 'data/gallery/thumbs/SAM_7354.JPG', 72),
(239, 'data/gallery/SAM_7356.JPG', 'data/gallery/thumbs/SAM_7356.JPG', 72),
(243, 'data/gallery/SAM_7377.JPG', 'data/gallery/thumbs/SAM_7377.JPG', 73),
(244, 'data/gallery/SAM_7382.JPG', 'data/gallery/thumbs/SAM_7382.JPG', 74),
(245, 'data/gallery/SAM_7384.JPG', 'data/gallery/thumbs/SAM_7384.JPG', 74),
(234, 'data/gallery/Karneval 2015, III. trieda 111.jpg', 'data/gallery/thumbs/Karneval 2015, III. trieda 111.jpg', 71),
(233, 'data/gallery/Karneval 2015, III. trieda 109.jpg', 'data/gallery/thumbs/Karneval 2015, III. trieda 109.jpg', 71),
(232, 'data/gallery/Karneval 2015, III. trieda 063.jpg', 'data/gallery/thumbs/Karneval 2015, III. trieda 063.jpg', 71),
(229, 'data/gallery/DSCF0653.JPG', 'data/gallery/thumbs/DSCF0653.JPG', 71),
(228, 'data/gallery/20150205_101247.jpg', 'data/gallery/thumbs/20150205_101247.jpg', 71),
(227, 'data/gallery/DSCF0620.JPG', 'data/gallery/thumbs/DSCF0620.JPG', 71),
(226, 'data/gallery/DSCF0589.JPG', 'data/gallery/thumbs/DSCF0589.JPG', 70),
(225, 'data/gallery/DSCF0587.JPG', 'data/gallery/thumbs/DSCF0587.JPG', 70),
(224, 'data/gallery/DSCF0579.JPG', 'data/gallery/thumbs/DSCF0579.JPG', 70),
(223, 'data/gallery/DSCF0467.JPG', 'data/gallery/thumbs/DSCF0467.JPG', 69),
(222, 'data/gallery/DSCF0482.JPG', 'data/gallery/thumbs/DSCF0482.JPG', 69),
(221, 'data/gallery/DSCF0466.JPG', 'data/gallery/thumbs/DSCF0466.JPG', 69),
(220, 'data/gallery/DSCF0460.JPG', 'data/gallery/thumbs/DSCF0460.JPG', 69),
(219, 'data/gallery/SAM_7201.JPG', 'data/gallery/thumbs/SAM_7201.JPG', 68),
(218, 'data/gallery/SAM_7236.JPG', 'data/gallery/thumbs/SAM_7236.JPG', 68),
(217, 'data/gallery/SAM_7196.JPG', 'data/gallery/thumbs/SAM_7196.JPG', 67),
(216, 'data/gallery/SAM_7176.JPG', 'data/gallery/thumbs/SAM_7176.JPG', 67),
(215, 'data/gallery/SAM_7174.JPG', 'data/gallery/thumbs/SAM_7174.JPG', 67),
(214, 'data/gallery/SAM_7145.JPG', 'data/gallery/thumbs/SAM_7145.JPG', 66),
(213, 'data/gallery/SAM_7112.JPG', 'data/gallery/thumbs/SAM_7112.JPG', 66),
(212, 'data/gallery/PC055799.JPG', 'data/gallery/thumbs/PC055799.JPG', 66),
(211, 'data/gallery/PC055879.JPG', 'data/gallery/thumbs/PC055879.JPG', 66),
(210, 'data/gallery/PC055900.JPG', 'data/gallery/thumbs/PC055900.JPG', 66),
(209, 'data/gallery/PC055808.JPG', 'data/gallery/thumbs/PC055808.JPG', 66),
(208, 'data/gallery/PC055820.JPG', 'data/gallery/thumbs/PC055820.JPG', 66),
(207, 'data/gallery/PC055812.JPG', 'data/gallery/thumbs/PC055812.JPG', 66),
(206, 'data/gallery/DSC07067.JPG', 'data/gallery/thumbs/DSC07067.JPG', 61),
(205, 'data/gallery/DSC07062.JPG', 'data/gallery/thumbs/DSC07062.JPG', 61),
(204, 'data/gallery/DSC07058.JPG', 'data/gallery/thumbs/DSC07058.JPG', 61),
(203, 'data/gallery/PC045779.JPG', 'data/gallery/thumbs/PC045779.JPG', 65),
(202, 'data/gallery/PC045781.JPG', 'data/gallery/thumbs/PC045781.JPG', 65),
(201, 'data/gallery/PC045774.JPG', 'data/gallery/thumbs/PC045774.JPG', 65),
(199, 'data/gallery/DSC09632.JPG', 'data/gallery/thumbs/DSC09632.JPG', 64),
(200, 'data/gallery/DSC09659.JPG', 'data/gallery/thumbs/DSC09659.JPG', 64),
(198, 'data/gallery/DSC09592.JPG', 'data/gallery/thumbs/DSC09592.JPG', 64),
(187, 'data/gallery/striga.jpg', 'data/gallery/thumbs/striga.jpg', 62),
(186, 'data/gallery/20141020_134540.jpg', 'data/gallery/thumbs/20141020_134540.jpg', 60),
(185, 'data/gallery/20141020_133322.jpg', 'data/gallery/thumbs/20141020_133322.jpg', 59),
(184, 'data/gallery/20141020_133309.jpg', 'data/gallery/thumbs/20141020_133309.jpg', 59),
(181, 'data/gallery/SAM_7076.JPG', 'data/gallery/thumbs/SAM_7076.JPG', 58),
(182, 'data/gallery/SAM_7077.JPG', 'data/gallery/thumbs/SAM_7077.JPG', 58),
(183, 'data/gallery/20141015_095154.jpg', 'data/gallery/thumbs/20141015_095154.jpg', 61),
(197, 'data/gallery/DSC09538.JPG', 'data/gallery/thumbs/DSC09538.JPG', 64),
(191, 'data/gallery/DSC09518.JPG', 'data/gallery/thumbs/DSC09518.JPG', 62),
(188, 'data/gallery/DSC09498.JPG', 'data/gallery/thumbs/DSC09498.JPG', 62),
(189, 'data/gallery/DSC09515.JPG', 'data/gallery/thumbs/DSC09515.JPG', 62),
(190, 'data/gallery/DSC09496.JPG', 'data/gallery/thumbs/DSC09496.JPG', 62),
(180, 'data/gallery/SAM_7074.JPG', 'data/gallery/thumbs/SAM_7074.JPG', 58),
(179, 'data/gallery/SAM_7073.JPG', 'data/gallery/thumbs/SAM_7073.JPG', 58),
(178, 'data/gallery/SAM_7071.JPG', 'data/gallery/thumbs/SAM_7071.JPG', 58),
(250, 'data/gallery/P1180427.JPG', 'data/gallery/thumbs/P1180427.JPG', 75),
(251, 'data/gallery/P1180426.JPG', 'data/gallery/thumbs/P1180426.JPG', 75),
(252, 'data/gallery/P1180418.JPG', 'data/gallery/thumbs/P1180418.JPG', 75),
(253, 'data/gallery/SAM_7408.JPG', 'data/gallery/thumbs/SAM_7408.JPG', 75),
(254, 'data/gallery/SAM_7421.JPG', 'data/gallery/thumbs/SAM_7421.JPG', 75),
(255, 'data/gallery/SAM_7425.JPG', 'data/gallery/thumbs/SAM_7425.JPG', 75),
(256, 'data/gallery/SAM_7445.JPG', 'data/gallery/thumbs/SAM_7445.JPG', 75),
(257, 'data/gallery/SAM_7508.JPG', 'data/gallery/thumbs/SAM_7508.JPG', 76),
(258, 'data/gallery/SAM_7503.JPG', 'data/gallery/thumbs/SAM_7503.JPG', 76),
(259, 'data/gallery/SAM_7501.JPG', 'data/gallery/thumbs/SAM_7501.JPG', 76),
(260, 'data/gallery/SAM_7494.JPG', 'data/gallery/thumbs/SAM_7494.JPG', 76),
(261, 'data/gallery/SAM_7492.JPG', 'data/gallery/thumbs/SAM_7492.JPG', 76),
(262, 'data/gallery/SAM_7476.JPG', 'data/gallery/thumbs/SAM_7476.JPG', 76),
(263, 'data/gallery/DSCF0691.JPG', 'data/gallery/thumbs/DSCF0691.JPG', 77),
(264, 'data/gallery/DSCF0694.JPG', 'data/gallery/thumbs/DSCF0694.JPG', 77),
(265, 'data/gallery/DSCF0697.JPG', 'data/gallery/thumbs/DSCF0697.JPG', 77),
(266, 'data/gallery/DSCF0699.JPG', 'data/gallery/thumbs/DSCF0699.JPG', 77),
(267, 'data/gallery/DSCF0707.JPG', 'data/gallery/thumbs/DSCF0707.JPG', 77),
(268, 'data/gallery/DSCF0713.JPG', 'data/gallery/thumbs/DSCF0713.JPG', 77),
(269, 'data/gallery/DSCF0719.JPG', 'data/gallery/thumbs/DSCF0719.JPG', 77),
(270, 'data/gallery/DSCF0722.JPG', 'data/gallery/thumbs/DSCF0722.JPG', 77),
(271, 'data/gallery/DSCF0723.JPG', 'data/gallery/thumbs/DSCF0723.JPG', 77),
(272, 'data/gallery/DSCF0729.JPG', 'data/gallery/thumbs/DSCF0729.JPG', 77),
(273, 'data/gallery/DSCF0732.JPG', 'data/gallery/thumbs/DSCF0732.JPG', 77),
(274, 'data/gallery/DSCF0736.JPG', 'data/gallery/thumbs/DSCF0736.JPG', 77),
(275, 'data/gallery/Environ a lienka Lenka 002.jpg', 'data/gallery/thumbs/Environ a lienka Lenka 002.jpg', 78),
(276, 'data/gallery/Environ a lienka Lenka 006.jpg', 'data/gallery/thumbs/Environ a lienka Lenka 006.jpg', 79),
(277, 'data/gallery/SAM_7539.JPG', 'data/gallery/thumbs/SAM_7539.JPG', 81),
(278, 'data/gallery/SAM_7541.JPG', 'data/gallery/thumbs/SAM_7541.JPG', 81),
(279, 'data/gallery/SAM_7542.JPG', 'data/gallery/thumbs/SAM_7542.JPG', 81),
(280, 'data/gallery/SAM_7552.JPG', 'data/gallery/thumbs/SAM_7552.JPG', 81),
(281, 'data/gallery/SAM_7513.JPG', 'data/gallery/thumbs/SAM_7513.JPG', 80),
(282, 'data/gallery/SAM_7534.JPG', 'data/gallery/thumbs/SAM_7534.JPG', 80),
(283, 'data/gallery/SAM_7564.JPG', 'data/gallery/thumbs/SAM_7564.JPG', 82),
(284, 'data/gallery/SAM_7571.JPG', 'data/gallery/thumbs/SAM_7571.JPG', 82),
(285, 'data/gallery/SAM_7572.JPG', 'data/gallery/thumbs/SAM_7572.JPG', 82),
(286, 'data/gallery/SAM_7574.JPG', 'data/gallery/thumbs/SAM_7574.JPG', 82),
(287, 'data/gallery/SAM_7563.JPG', 'data/gallery/thumbs/SAM_7563.JPG', 82),
(288, 'data/gallery/SAM_7581.JPG', 'data/gallery/thumbs/SAM_7581.JPG', 83),
(289, 'data/gallery/SAM_7590.JPG', 'data/gallery/thumbs/SAM_7590.JPG', 83),
(290, 'data/gallery/SAM_7595.JPG', 'data/gallery/thumbs/SAM_7595.JPG', 83),
(291, 'data/gallery/SAM_7598.JPG', 'data/gallery/thumbs/SAM_7598.JPG', 83),
(292, 'data/gallery/SAM_7602.JPG', 'data/gallery/thumbs/SAM_7602.JPG', 83),
(293, 'data/gallery/DSCF0740.JPG', 'data/gallery/thumbs/DSCF0740.JPG', 84),
(294, 'data/gallery/DSCF0738.JPG', 'data/gallery/thumbs/DSCF0738.JPG', 84),
(295, 'data/gallery/DSCF0744.JPG', 'data/gallery/thumbs/DSCF0744.JPG', 84),
(296, 'data/gallery/Deň matiek 2015 006.jpg', 'data/gallery/thumbs/Deň matiek 2015 006.jpg', 84),
(297, 'data/gallery/Deň matiek 2015 008.jpg', 'data/gallery/thumbs/Deň matiek 2015 008.jpg', 84),
(298, 'data/gallery/Deň matiek 2015 009.jpg', 'data/gallery/thumbs/Deň matiek 2015 009.jpg', 84),
(299, 'data/gallery/SAM_7737.JPG', 'data/gallery/thumbs/SAM_7737.JPG', 85),
(300, 'data/gallery/SAM_7740.JPG', 'data/gallery/thumbs/SAM_7740.JPG', 85),
(301, 'data/gallery/SAM_7743.JPG', 'data/gallery/thumbs/SAM_7743.JPG', 85),
(302, 'data/gallery/SAM_7749.JPG', 'data/gallery/thumbs/SAM_7749.JPG', 85),
(303, 'data/gallery/SAM_7621.JPG', 'data/gallery/thumbs/SAM_7621.JPG', 85),
(304, 'data/gallery/SAM_7629.JPG', 'data/gallery/thumbs/SAM_7629.JPG', 85),
(305, 'data/gallery/SAM_7641.JPG', 'data/gallery/thumbs/SAM_7641.JPG', 85),
(306, 'data/gallery/SAM_7660.JPG', 'data/gallery/thumbs/SAM_7660.JPG', 85),
(307, 'data/gallery/SAM_7674.JPG', 'data/gallery/thumbs/SAM_7674.JPG', 85),
(308, 'data/gallery/SAM_7678.JPG', 'data/gallery/thumbs/SAM_7678.JPG', 85),
(309, 'data/gallery/SAM_7682.JPG', 'data/gallery/thumbs/SAM_7682.JPG', 85),
(310, 'data/gallery/SAM_7685.JPG', 'data/gallery/thumbs/SAM_7685.JPG', 85),
(311, 'data/gallery/SAM_7713.JPG', 'data/gallery/thumbs/SAM_7713.JPG', 85),
(312, 'data/gallery/SAM_7709.JPG', 'data/gallery/thumbs/SAM_7709.JPG', 85),
(313, 'data/gallery/SAM_7722.JPG', 'data/gallery/thumbs/SAM_7722.JPG', 85),
(314, 'data/gallery/SAM_7760.JPG', 'data/gallery/thumbs/SAM_7760.JPG', 85),
(315, 'data/gallery/SAM_7693.JPG', 'data/gallery/thumbs/SAM_7693.JPG', 85),
(316, 'data/gallery/SAM_7694.JPG', 'data/gallery/thumbs/SAM_7694.JPG', 85),
(317, 'data/gallery/SAM_7697.JPG', 'data/gallery/thumbs/SAM_7697.JPG', 85),
(318, 'data/gallery/SAM_7696.JPG', 'data/gallery/thumbs/SAM_7696.JPG', 85),
(319, 'data/gallery/SAM_7700.JPG', 'data/gallery/thumbs/SAM_7700.JPG', 85),
(320, 'data/gallery/20150526_101028.jpg', 'data/gallery/thumbs/20150526_101028.jpg', 86),
(321, 'data/gallery/20150526_095026.jpg', 'data/gallery/thumbs/20150526_095026.jpg', 86),
(322, 'data/gallery/20150526_094248.jpg', 'data/gallery/thumbs/20150526_094248.jpg', 86),
(323, 'data/gallery/DSCF0779.JPG', 'data/gallery/thumbs/DSCF0779.JPG', 87),
(324, 'data/gallery/DSCF0780.JPG', 'data/gallery/thumbs/DSCF0780.JPG', 87),
(325, 'data/gallery/DSCF0774.JPG', 'data/gallery/thumbs/DSCF0774.JPG', 87),
(326, 'data/gallery/DSCF0775.JPG', 'data/gallery/thumbs/DSCF0775.JPG', 87),
(327, 'data/gallery/IMG_0845.JPG', 'data/gallery/thumbs/IMG_0845.JPG', 88),
(328, 'data/gallery/IMG_0849.JPG', 'data/gallery/thumbs/IMG_0849.JPG', 88),
(329, 'data/gallery/IMG_0858.JPG', 'data/gallery/thumbs/IMG_0858.JPG', 88),
(330, 'data/gallery/IMG_0919.JPG', 'data/gallery/thumbs/IMG_0919.JPG', 88),
(331, 'data/gallery/IMG_0844.JPG', 'data/gallery/thumbs/IMG_0844.JPG', 88),
(332, 'data/gallery/MDD 2015 003.jpg', 'data/gallery/thumbs/MDD 2015 003.jpg', 85),
(333, 'data/gallery/MDD 2015 002.jpg', 'data/gallery/thumbs/MDD 2015 002.jpg', 85),
(334, 'data/gallery/MDD 2015 013.jpg', 'data/gallery/thumbs/MDD 2015 013.jpg', 87),
(335, 'data/gallery/11270400_1036563709702187_5394566069094726804_o.jpg', 'data/gallery/thumbs/11270400_1036563709702187_5394566069094726804_o.jpg', 90),
(336, 'data/gallery/DSCF0788.JPG', 'data/gallery/thumbs/DSCF0788.JPG', 88),
(337, 'data/gallery/DSCF0789.JPG', 'data/gallery/thumbs/DSCF0789.JPG', 88),
(338, 'data/gallery/DSCF0784.JPG', 'data/gallery/thumbs/DSCF0784.JPG', 88),
(339, 'data/gallery/DSCF0828.JPG', 'data/gallery/thumbs/DSCF0828.JPG', 91),
(340, 'data/gallery/DSCF0832.JPG', 'data/gallery/thumbs/DSCF0832.JPG', 91),
(341, 'data/gallery/DSCF0835.JPG', 'data/gallery/thumbs/DSCF0835.JPG', 91),
(342, 'data/gallery/DSCF0840.JPG', 'data/gallery/thumbs/DSCF0840.JPG', 91),
(343, 'data/gallery/DSCF0843.JPG', 'data/gallery/thumbs/DSCF0843.JPG', 91),
(344, 'data/gallery/DSCF0846.JPG', 'data/gallery/thumbs/DSCF0846.JPG', 91),
(345, 'data/gallery/DSCF0850.JPG', 'data/gallery/thumbs/DSCF0850.JPG', 91),
(346, 'data/gallery/DSCF0851.JPG', 'data/gallery/thumbs/DSCF0851.JPG', 91),
(347, 'data/gallery/DSCF0855.JPG', 'data/gallery/thumbs/DSCF0855.JPG', 91),
(348, 'data/gallery/Výlet na Košútku 5.6.2015 048.jpg', 'data/gallery/thumbs/Výlet na Košútku 5.6.2015 048.jpg', 92),
(349, 'data/gallery/Výlet na Košútku 5.6.2015 056.jpg', 'data/gallery/thumbs/Výlet na Košútku 5.6.2015 056.jpg', 92),
(350, 'data/gallery/Výlet na Košútku 5.6.2015 058.jpg', 'data/gallery/thumbs/Výlet na Košútku 5.6.2015 058.jpg', 92),
(351, 'data/gallery/P6010462.JPG', 'data/gallery/thumbs/P6010462.JPG', 87),
(352, 'data/gallery/P6010453.JPG', 'data/gallery/thumbs/P6010453.JPG', 87),
(353, 'data/gallery/P6010452.JPG', 'data/gallery/thumbs/P6010452.JPG', 87),
(354, 'data/gallery/P6010446.JPG', 'data/gallery/thumbs/P6010446.JPG', 87),
(355, 'data/gallery/detva.jpg', 'data/gallery/thumbs/detva.jpg', 94),
(356, 'data/gallery/SAM_7837.JPG', 'data/gallery/thumbs/SAM_7837.JPG', 95),
(357, 'data/gallery/SAM_7842.JPG', 'data/gallery/thumbs/SAM_7842.JPG', 95),
(358, 'data/gallery/SAM_7844.JPG', 'data/gallery/thumbs/SAM_7844.JPG', 95),
(359, 'data/gallery/SAM_7845.JPG', 'data/gallery/thumbs/SAM_7845.JPG', 95),
(360, 'data/gallery/SAM_7864.JPG', 'data/gallery/thumbs/SAM_7864.JPG', 95),
(361, 'data/gallery/SAM_7870.JPG', 'data/gallery/thumbs/SAM_7870.JPG', 95),
(362, 'data/gallery/SAM_7877.JPG', 'data/gallery/thumbs/SAM_7877.JPG', 95),
(363, 'data/gallery/SAM_7889.JPG', 'data/gallery/thumbs/SAM_7889.JPG', 95),
(364, 'data/gallery/SAM_7896.JPG', 'data/gallery/thumbs/SAM_7896.JPG', 95);

-- --------------------------------------------------------

--
-- Table structure for table `ms_notes`
--

CREATE TABLE IF NOT EXISTS `ms_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `content` text CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `color` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `user` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `ms_notes`
--

INSERT INTO `ms_notes` (`id`, `title`, `content`, `color`, `order`, `date`, `user`) VALUES
(3, 'Zapíš ma do materskej školy', '<p>Radi va&scaron;e deti v na&scaron;ej materskej &scaron;kole priv&iacute;tame. Prihl&aacute;&scaron;ku si m&ocirc;žete stiahnuť <strong><a href="data/others/žiadosť.JPG" target="_blank">tu</a></strong></p>\r\n<p>&nbsp;</p>\r\n<p><span style="color: #0000ff;">&nbsp;</span></p>', 3, 2, '2015-04-09 20:50:49', '7msdt'),
(4, 'Výročná správa', '<p>V&yacute;ročn&uacute; spr&aacute;vu si m&ocirc;žete pozrieť&nbsp;<a href="data/others/_Hodnotiaca%20spr&aacute;va 2013_,2014.pdf"><strong>tu</strong></a></p>', 2, 4, '2015-04-02 09:36:49', '7msdt'),
(9, 'Prevádzka MŠ počas letných prázdnin', '<p style="text-align: left;">V mesiaci <strong>J&Uacute;L 2015</strong><strong>&nbsp; </strong>je M&Scaron;<strong> zatvoren&aacute;.<br /></strong></p>\r\n<p style="text-align: left;">V mesiaci <strong>AUGUST 2015</strong> prev&aacute;dzka M&Scaron; <strong>od 3. 8. do 31. 8. 2015</strong>.</p>\r\n<p style="text-align: left;"><strong>&Scaron;kolsk&yacute; rok 2015/2016</strong> zač&iacute;na<strong> 2. 9. 2015.</strong></p>', 0, 0, '2015-07-01 15:55:45', '7msdt'),
(18, 'Voľné pracovné miesto', '<p><strong>Matersk&aacute; &scaron;kola A. Bernol&aacute;ka 19, Detva</strong> oznamuje voľn&eacute; pracovn&eacute; miesto - <strong>učiteľ pre predprim&aacute;rne vzdel&aacute;vanie</strong>. Podrobn&eacute; inform&aacute;cie <a href="data/others/VOĽN&Eacute;%20PRACOVN&Eacute;%20MIESTO.pdf" target="_blank">tu</a></p>', 3, 1, '2015-06-10 19:58:49', 'kokso'),
(13, 'Na stiahnutie tlačivá', '<p>Splnomocnenie k prevzatiu dieťaťa z M&Scaron; <a href="data/others/SPLNOMOCNENIE.pdf">tu </a></p>', 1, 3, '2015-05-17 23:15:06', '7msdt');

-- --------------------------------------------------------

--
-- Table structure for table `ms_sites`
--

CREATE TABLE IF NOT EXISTS `ms_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin2 COLLATE latin2_czech_cs NOT NULL,
  `url_tag` varchar(45) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ms_sites`
--

INSERT INTO `ms_sites` (`id`, `name`, `url_tag`, `order`) VALUES
(1, 'O nás', 'Onas', 1),
(2, 'Oznamy', 'Oznamy', 2),
(3, 'Podujatia', 'Podujatia', 3),
(4, 'Zverejňovanie', 'Zverejnovanie', 4),
(5, 'Kontakty', 'Kontakty', 5);

-- --------------------------------------------------------

--
-- Table structure for table `ms_users`
--

CREATE TABLE IF NOT EXISTS `ms_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(10) NOT NULL,
  `r_doc` tinyint(4) NOT NULL,
  `r_event` tinyint(4) NOT NULL,
  `r_info` tinyint(4) NOT NULL,
  `last_activity` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ms_users`
--

INSERT INTO `ms_users` (`id`, `login`, `password`, `role`, `r_doc`, `r_event`, `r_info`, `last_activity`) VALUES
(1, 'kokso', 'ac26e0e8e5ccd9f5662c1cf813ff0dc6', 'admin', 1, 1, 1, '2015-07-10 14:55:31'),
(2, '7msdt', '1dcc2f27130b67068a2cb3bb5b682ac5', 'admin', 1, 1, 1, '2015-07-01 15:35:26'),
(5, 'bubble', 'a70f9e38ff015afaa9ab0aacabee2e13', 'admin', 1, 1, 1, '2014-01-26 21:08:31'),
(6, 'cukrík', 'b309b9b818b62e435c71cec80a34dd92', 'admin', 1, 1, 1, '2014-11-25 14:41:32');
