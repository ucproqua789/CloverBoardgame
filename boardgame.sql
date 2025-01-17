USE [master]
GO
/****** Object:  Database [BOARDGAME]    Script Date: 11/12/2020 11:04:03 AM ******/
CREATE DATABASE [BOARDGAME]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BOARDGAME', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BOARDGAME.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BOARDGAME_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BOARDGAME_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BOARDGAME] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BOARDGAME].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BOARDGAME] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BOARDGAME] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BOARDGAME] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BOARDGAME] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BOARDGAME] SET ARITHABORT OFF 
GO
ALTER DATABASE [BOARDGAME] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BOARDGAME] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BOARDGAME] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BOARDGAME] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BOARDGAME] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BOARDGAME] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BOARDGAME] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BOARDGAME] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BOARDGAME] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BOARDGAME] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BOARDGAME] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BOARDGAME] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BOARDGAME] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BOARDGAME] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BOARDGAME] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BOARDGAME] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BOARDGAME] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BOARDGAME] SET RECOVERY FULL 
GO
ALTER DATABASE [BOARDGAME] SET  MULTI_USER 
GO
ALTER DATABASE [BOARDGAME] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BOARDGAME] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BOARDGAME] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BOARDGAME] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BOARDGAME] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BOARDGAME', N'ON'
GO
ALTER DATABASE [BOARDGAME] SET QUERY_STORE = OFF
GO
USE [BOARDGAME]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 11/12/2020 11:04:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGame]    Script Date: 11/12/2020 11:04:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGame](
	[gameID] [int] IDENTITY(1,1) NOT NULL,
	[categoryID] [int] NULL,
	[gameName] [nvarchar](max) NOT NULL,
	[gameDescription] [nvarchar](max) NOT NULL,
	[gamePrice] [int] NOT NULL,
	[gameImage] [nvarchar](max) NOT NULL,
	[gameQuantity] [int] NULL,
	[gameStatus] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[gameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 11/12/2020 11:04:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [varchar](50) NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[orderAddress] [nvarchar](max) NOT NULL,
	[orderPhone] [varchar](10) NOT NULL,
	[totalOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrdergame]    Script Date: 11/12/2020 11:04:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrdergame](
	[ordergameID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[gameID] [int] NOT NULL,
	[numOfgame] [int] NULL,
	[pricegame] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ordergameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 11/12/2020 11:04:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userName] [varchar](50) NOT NULL,
	[userRole] [varchar](100) NOT NULL,
	[userFullName] [nvarchar](100) NULL,
	[userPass] [char](100) NOT NULL,
	[userPhone] [varchar](10) NULL,
	[userAddress] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1, N'Kid')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2, N'Adult')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (3, N'Couple')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (4, N'Family')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (5, N'Single')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (6, N'All')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblGame] ON 

INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (1, 4, N'Monopoly', N'Monopoly is a board game currently published by Hasbro. In the game, players roll two six-sided dice to move around the game board, buying and trading properties, and developing them with houses and hotels. Players collect rent from their opponents, with the goal being to drive them into bankruptcy. Money can also be gained or lost through Chance and Community Chest cards, and tax squares; players can end up in jail, which they cannot move from until they have met one of several conditions. The game has numerous house rules, and hundreds of different editions exist, as well as many spin-offs and related media. Monopoly has become a part of international popular culture, having been licensed locally in more than 103 countries and printed in more than 37 languages.', 850000, N'monopoly.jpg', 16, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (2, 1, N'Exploding Kitten', N'Exploding Kittens - Exploding Kittens has emerged as a phenomenon in the past few years. Not to mention gameplay, but in terms of marketing this was a real success.

This game only takes 8 minutes to reach its goal of 8,000 USD to raise funds, and 7 days to rise to become the "most popular project" in the history of Kickstarter.
The game rules revolve around the "Exploding Kitten" card out of 56 cards. The 4 players will take turns drawing in turn and whoever draws the Exploding Kitten first loses. Of course there are 56 cards out of the 56 that will help you avoid the fate of "exploding" such as the Defuse that disable Exploding Kitten, delay your turn and push it to other players. before the first 3 cards in the stack to calculate strategy ...
A game guide is included in the product box.', 100000, N'exploKitten.jpg', 17, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (8, 2, N'Splendor', N'At a flourishing Renaissance, with rapid economic and political growth, would you miss this favorable opportunity with lucrative gem deals? Coming to Splendor, you will become a merchant, buying and selling gems, vehicles, and shops to both enrich yourself, resonate and win a reputation for noble house, the elite. So, please use smartly what you have and calculate correctly to become the person who earns the most points through trading activities, interacting with the nobility to win. Launched in 2014 by Space Cowboys, the Splendor game immediately attracted the attention of board game players around the world because of the extremely simple rules of the game, but extremely tactical. That also explains Splendor''s appearance in the list of the last three names nominated for the best game category of the year Spiel Des Jahres along with Camel Up and Concept!', 800000, N'splendor.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (9, 2, N'Deception Muder', N'In the game, players take on the roles of investigators attempting to solve a murder case – but there''s a twist. The killer is one of the investigators! Each player''s role and team are randomly assigned at the start of play and include the unique roles of Forensic Scientist, Witness, Investigator, Murderer, and Accomplice. While the Investigators attempt to deduce the truth, the murderer''s team must deceive and mislead. This is a battle of wits!

The Forensic Scientist has the solution but can express the clues only using special scene tiles while the investigators (and the murderer) attempt to interpret the evidence. In order to succeed, the investigators must not only deduce the truth from the clues of the Forensic Scientist, they must also see through the misdirection being injected into the equation by the Murderer and Accomplice!

Find out who among you can cut through deception to find the truth and who is capable of getting away with murder!', 1000000, N'deception.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (10, 1, N'Pop-up Pirate', N'Pirate Strike Boardgame will find the winner with your own rules. Use your dagger to force the pirate to reveal himself to enjoy the exciting entertainment experiences. There is only one single hole that when you hit the Pirate, you try your luck while playing.

The battle of luck is full of tough times
If you are a fan of mischievous larvae, you probably already know the pirate stab game. The pirates hide in a large wine barrel, there are many holes in the barrel, but only a single hole will hit the Pirate and the Pirate will "jump" to stand. Very interesting!', 150000, N'haitac.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (11, 4, N'Galaxy Beast', N'Together the 12 zodiac warriors conquer Super Beasts to save the world before it''s too late!.Due to their curious and mischievous nature, the two Gemini brothers unintentionally woke up all the beasts in the book "The Milky Way Super Beast Encyclopedia". The animals that escaped the seal are warned to cause immeasurable danger. Therefore, within 8 days, the "12 Zodiacs" were assigned the task of returning the beast back to the book.

As your own zodiac sign, you will be transformed into legendary warriors, possessing supernatural powers to fight and conquer mischievous Super Beast swarms and rescue the Milky Way from destruction.', 660000, N'beast.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (12, 5, N'Gizmos', N'This is a game about building machines.

The context of the game is very unique when players will play the role of geniuses with great intelligence and compete with each other to see who will build the best machine at the "World Science Fair". . The simple logic is to build a machine by building individual machine parts with energy marbles from the power distribution furnace. The special feature of the game is that each machine part will be made of different energy colors (red, yellow, black, blue) and they will bring about different benefits to help players more easily. Build the following machines, so players will have to think carefully and have a specific strategy before building any machine.', 1100000, N'gizmos.png', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (13, 5, N'Marvel Champions', N'Although it was only released at the end of 2019, Marvel Champions has continuously broken records, reached top sales when it came back, as well as in the top game of the year of a series of sites. reputation as well as being encouraged by the board game reviewers to play a lot. The expansion of the game is also constantly being released and received by a large number of fans. Let''s take a look at Marvel Champions, the newest brainchild from Fantasy Flight Games.
As soon as you look at the game box, you can recognize a series of familiar characters in the Marvel universe. Those are the superheroes Spider-Man, Black Panther, Iron Man, Thor, Captain America, along with the villains Thanos, Ultron, Zemo. An epic game box cover is ready to pave the way for you to enter epic battles no less!

 

Also on the box, you can see the LCG tag, meaning the game will be in the Living Card Game genre, when you will know for sure that you will receive when buying each product, and you do not have to complain. if not lucky like other CCG or TCG games. And the game belongs to the cooperative game group, when you will be accompanied by other players, fighting against the villains (villains) controlled by the game''s mechanism. The game is designed for 1-4 players, so you can easily play solo when you can''t find anyone to play with.

Let''s take a look at the introductory video from the publisher.', 1490000, N'marvel.png', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (14, 3, N'Patchwork Express', N'In Patchwork, two players compete to build the most aesthetic (and high-scoring) patchwork quilt on a personal 9x9 game board. To start play, lay out all of the patches at random in a circle and place a marker directly clockwise of the 2-1 patch. Each player takes five buttons — the currency/points in the game — and someone is chosen as the start player.', 500000, N'patchwork.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (15, 3, N'Santorini', N'About This Item
WARNING - CHOKING HAZARD - Children Under 3
This toy is not suitable for ages under 3 years. It contains one or more of the following items marbles; small ball; or small parts.
We aim to show you accurate product information. Manufacturers, suppliers and others provide what you see here, and we have not verified it. See our disclaimer
Build like a mortal, win like a God in the game of Santorini, the strategic family board game by Gordon Hamilton. The objective is simple: Be the first player to build, block, and climb your way to the top of a building three stories high. Sounds easy? Not so fast! Santorini requires tactical manoeuvring and increases in difficulty with the addition of extra powers via “god” cards. With thousands of possibilities and unlimited replay value, each round of Santorini is exciting and new! Unfold the beautiful game board and challenge your friends and family to construct gorgeous buildings! Both kids and adults can play this game that tests the bounds of mortal intelligence. Join the pantheon of winners in the game of Santorini!
Santorini is a strategy-based board game that’s exhilarating and intellectually challenging! Play together and make family game night even more fun!
Race to build your way to the top of a stack of blocks! Use builder pieces and move one space in any direction.
Each player is dealt a God Card to be used strategically. When you find yourself in a tight spot, break or bend the rules!
Play against an opponent or team up and play two against two.
Includes: 22 Bottom Blocks, 18 Middle blocks, 14 Top Blocks, 18 Domes, 6 Builders, 30 God Cards, 1 Play Board, 1 Decorative Cliff, 1 Instructions
WARNING: CHOKING HAZARD - Small parts. Not for children under 3 years.', 490000, N'santorini.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (16, 3, N'The Sea Battle', N'Battleship Board Game, Includes Coloring and Activity Sheet for Kids Ages 7 and Up, 2-Player Strategy Game

SHIP-SINKING FUN: Kids ages 7 and up can enjoy playing head-to-head with this classic game of naval combat
INCLUDES FUN ACTIVITY SHEET: This edition of the game includes a fun activity sheet for kids featuring a wordsearch, coloring activity, maze, break the spy code, and more
STRATEGY GAME FOR KIDS: With this classic Battleship board game for 2 players, kids can imagine their ultimate search-and-destroy mission. Call a shot and fire! Sink an opponent''s ships for the win
OPTION FOR ADVANCED PLAY: The game comes with a Salvo feature that lets advanced players launch multiple attacks
INCLUDES PORTABLE BATTLE CASES: This game includes 2 portable cases so the game is easy to store and take on the go. It makes a great birthday gift or holiday gift for kids ages 7 and up
This Battleship board game is the classic game of naval combat that brings together competition, strategy, and excitement. In head-to-head battle, 2 players search for the enemy''s fleet of ships and destroy them one by one. This edition of the game includes a coloring and activity sheet for kids. The sheet includes activities such as a wordsearch puzzle, a maze, spot the difference, and more. And with convenient portable battle cases and realistic looking naval crafts, the Battleship game puts players right in the middle of the action. The game makes a fun holiday present or birthday gift for kids ages 7 and up, and is an easy choice for a rainy day activity or playdate.', 450000, N'battleship.jpeg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (18, 1, N'Mathematics', N'"Precious treasures have been discovered in the magic forest. You could be the owner if you were faster than the others. Following the escape signals from your friend Dwarf Mushroom, will be Your suggestion is for you to follow the right path. The race starts and the fastest, quickest, fastest calculator will be the winner! "

Math Add and Subtract is a special version of Math, with simpler rules that are suitable for even younger children.
In this game, you need to do the math correctly and quickly, whoever hits all the cards first wins.
Everyone playing at the same time not in turn, so the game will be very dramatic, interesting with the competition with each other.
This is an interesting, simple game and helps improve fast calculation ability, mathematical thinking, social interaction; Especially suitable for educational purposes for children and students.
Math Plus Subtraction is a product made in Vietnam with extremely good quality, safe, guaranteed to make you satisfied. Study while playing with Math Match, Plus Subtraction version!', 100000, N'mathematics.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (20, 4, N'Dixit Revelations (US)', N'Dixit is a card game created by Jean-Louis Roubira, illustrated by Marie Cardouat, and published by Libellud. Using a deck of cards illustrated with dreamlike images, players select cards that match a title suggested by the "storyteller", and attempt to guess which card the "storyteller" selected.', 1090000, N'dixit.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (21, 3, N'Scrabble', N'Put letters together, build words, add up your points and win with this Scrabble Board Game. This classic game features the classic Scrabble equipment for a big-time word-on-word showdown on the board. Do you see a word your opponent hasn''t seen? A double or triple letter or word space that will let you earn big points? Use your letters to score points and challenge your family and friends. Every letter counts.', 465000, N'scrabble.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (22, 4, N'Love Letter (US)', N'Love Letter is a game of risk, deduction, and luck for 2–4 players. Your goal is to get your love letter into Princess Annette''s hands while deflecting the letters from competing suitors. ... On a turn, you draw one card, and play one card, trying to expose others and knock them from the game.', 240000, N'loveletter.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (23, 5, N'Wingspan (US)', N'Wingspan launched in 2019, is a board game from famous game publisher Stonemaier, the name associated with games like Scythe, Chaterstone, Euphoria ..., and is a booming game in 2019. true bird games, and if playing birds is also an art, each player will be a real artist. In the game, players will be transformed into ornithologists, ecologists, zoologists when they have to calculate to decide whether they should attract more birds to the nest, or let them lay eggs. Or to pick up more food for them, to form a network of wild birds. All because of a single goal is to satisfy the quests'' requirement and win points to win after a short time of release. Kennerspiel des Jahres 2019 average difficulty game category. It''s a predictable result before looking at the craze that Wingspan has created: sold out all over the world! The game also received positive feedback and reviews from experts and boardgame community around the world. The rateing 8.1 on the reputable boardgamegeek game review page is the clearest proof for that, a dream score for many other board games, when the game only needs to be rate 7+ on boardgamegeek. rated as a good game.', 2090000, N'wingspan.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (25, 5, N'Sanguosha', N'Time makes heroes. In the era of the Three Kingdoms era with chaotic wars popping up everywhere, outstanding figures emerge with special talents - they are the ones with the power to change destiny. Many famous names such as Luu Be, Quan Vu, Cao Cao, Trieu Tu Long, Lu Bo, Chan Co, Ton Quyen, ... mentioned in the novel Three Kingdoms Dien Nghia, now come alive in a card The most popular game today - Tam Quoc Sat.', 230000, N'tqs.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (26, 2, N'Uno kiss', N'
A special version of the famous card game Uno, which is Bai Auditor! The rules are similar to regular Uno but add special cards that function like giving commands, setting a theme, spinning around, drinking a glass of water, or even forcing… kiss someone else! The Card is a game suitable for playing in large groups, especially at parties and parties. If you like Uno, you can''t miss the Test!', 900000, N'unokiss.jpg', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (27, 2, N'Catan', N'Catan is the original strategy board game. Your adventurous settlers seek to tame the remote but rich isle of Catan. Start by revealing Catan''s many harbors and regions: pastures, fields, mountains, hills, forests, and desert. The random mix creates a different board virtually every game. No two games are the same! Embark on a quest to settle the isle of Catan! Guide your settlers to victory through clever trading and cunning development. Use resource combinations - grain, wool, ore, brick, and lumber - to buy handy development cards and build roads, settlements, and cities. Acquire your resources through trades, cards, or lucky dice (even outside your turn). But beware Someone might cut off your road or buy a monopoly. And you never know when the wily robber might steal some of your precious gains

The incredibly popular, multi-award winning civilization-building board game of harvesting and trading resources
Players control their own civilization and look to spread across a modular hex-board in a competition for victory points
Beware the robber’s nefarious plans as he steals resources and plunders the wealthy.
Catan has won multiple awards and is one of the most popular games in recent history due to its amazing ability to appeal to experienced gamers as well as those new to the hobby
Numerous spin-offs and expansions have also been made for the game.', 1350000, N'catan.png', 10, N'Active')
INSERT [dbo].[tblGame] ([gameID], [categoryID], [gameName], [gameDescription], [gamePrice], [gameImage], [gameQuantity], [gameStatus]) VALUES (28, 1, N'Astrology Class', N'Cryptography Class is an extremely cute and unique game created by the group of BRO authors, the board game is adapted from the comic of the same name, Best Seller 2016-2018 in Fahasa and is one of 10 titles. favorite books 2018. Published by BoardgameVN and Review by Time Sun See Studio, Toy Station, Comicola, Tho Nguyen', 440000, N'astrology.jpg', 10, N'Active')
SET IDENTITY_INSERT [dbo].[tblGame] OFF
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (9, N'kimhang', CAST(N'2020-11-09T16:45:26.313' AS DateTime), N'Tphcm', N'0123456789', 850000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (10, N'kimhang', CAST(N'2020-11-11T12:32:03.643' AS DateTime), N'Tphcm', N'0123456789', 1700000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (11, N'kimhang', CAST(N'2020-11-11T22:36:53.820' AS DateTime), N'Tphcm', N'0123456789', 3400000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (12, N'kimhang', CAST(N'2020-11-12T00:45:22.437' AS DateTime), N'Address', N'0919799125', 300000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (13, N'kimhang', CAST(N'2020-11-12T01:37:28.773' AS DateTime), N'Address', N'0919799125', 100000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (14, N'kimhang', CAST(N'2020-11-12T01:40:20.333' AS DateTime), N'Address', N'0919799125', 100000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (15, N'kimhang', CAST(N'2020-11-12T01:41:32.590' AS DateTime), N'Address', N'0919799125', 100000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (16, N'kimhang', CAST(N'2020-11-12T01:46:32.877' AS DateTime), N'Address', N'0919799125', 100000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (17, N'kimhang', CAST(N'2020-11-12T01:48:26.867' AS DateTime), N'Address', N'0919799125', 100000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (18, N'kimhang', CAST(N'2020-11-12T01:49:08.060' AS DateTime), N'Address', N'0919799125', 100000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (19, N'kimhang', CAST(N'2020-11-12T01:49:27.667' AS DateTime), N'Address', N'0919799125', 950000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (20, N'kimhang', CAST(N'2020-11-12T07:39:03.533' AS DateTime), N'Address', N'0919799125', 2650000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (21, N'kimhang', CAST(N'2020-11-12T10:53:58.537' AS DateTime), N'Address', N'0919799125', 9000000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (22, N'kimhang', CAST(N'2020-11-12T10:55:35.840' AS DateTime), N'Address', N'0919799125', 9000000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (23, N'kimhang', CAST(N'2020-11-12T10:56:11.303' AS DateTime), N'Address', N'0919799125', 9000000)
INSERT [dbo].[tblOrder] ([orderID], [userName], [orderDate], [orderAddress], [orderPhone], [totalOrder]) VALUES (24, N'kimhang', CAST(N'2020-11-12T10:57:50.423' AS DateTime), N'Address', N'0919799125', 1800000)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrdergame] ON 

INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (3, 9, 1, 1, 850000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (4, 10, 1, 2, 850000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (5, 11, 1, 4, 850000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (6, 12, 2, 2, 150000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (7, 13, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (8, 14, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (9, 15, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (10, 16, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (11, 17, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (12, 18, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (13, 19, 1, 1, 850000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (14, 19, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (15, 20, 1, 3, 850000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (16, 20, 2, 1, 100000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (17, 21, 26, 10, 900000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (18, 22, 26, 10, 900000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (19, 23, 26, 10, 900000)
INSERT [dbo].[tblOrdergame] ([ordergameID], [orderID], [gameID], [numOfgame], [pricegame]) VALUES (20, 24, 26, 2, 900000)
SET IDENTITY_INSERT [dbo].[tblOrdergame] OFF
INSERT [dbo].[tblUser] ([userName], [userRole], [userFullName], [userPass], [userPhone], [userAddress]) VALUES (N'hauhuong', N'Admin', N'Lam Hau Huong', N'123                                                                                                 ', N'0919799124', N'Address')
INSERT [dbo].[tblUser] ([userName], [userRole], [userFullName], [userPass], [userPhone], [userAddress]) VALUES (N'kimhang', N'Customer', N'Nguyen Thi Kim Hang', N'123                                                                                                 ', N'0919799125', N'Address')
INSERT [dbo].[tblUser] ([userName], [userRole], [userFullName], [userPass], [userPhone], [userAddress]) VALUES (N'quoclap', N'Staff', N'Truong Quoc Lap', N'123                                                                                                 ', N'0917522421', N'Address')
INSERT [dbo].[tblUser] ([userName], [userRole], [userFullName], [userPass], [userPhone], [userAddress]) VALUES (N'staff', N'Staff', N'Staff', N'1                                                                                                   ', N'0123456789', N'tphcm')
INSERT [dbo].[tblUser] ([userName], [userRole], [userFullName], [userPass], [userPhone], [userAddress]) VALUES (N'username', N'Customer', N'UserName', N'1                                                                                                   ', N'0123456789', N'tphcm')
ALTER TABLE [dbo].[tblGame] ADD  DEFAULT ('0') FOR [gameQuantity]
GO
ALTER TABLE [dbo].[tblGame] ADD  DEFAULT ('Active') FOR [gameStatus]
GO
ALTER TABLE [dbo].[tblOrdergame] ADD  DEFAULT ('1') FOR [numOfgame]
GO
ALTER TABLE [dbo].[tblUser] ADD  DEFAULT ('Customer') FOR [userRole]
GO
ALTER TABLE [dbo].[tblGame]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[tblUser] ([userName])
GO
ALTER TABLE [dbo].[tblOrdergame]  WITH CHECK ADD FOREIGN KEY([gameID])
REFERENCES [dbo].[tblGame] ([gameID])
GO
ALTER TABLE [dbo].[tblOrdergame]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblGame]  WITH CHECK ADD CHECK  (([gamePrice]>(0)))
GO
ALTER TABLE [dbo].[tblGame]  WITH CHECK ADD CHECK  (([gameQuantity]>=(0)))
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD CHECK  (([totalOrder]>(0)))
GO
ALTER TABLE [dbo].[tblOrdergame]  WITH CHECK ADD CHECK  (([numOfgame]>=(0)))
GO
ALTER TABLE [dbo].[tblOrdergame]  WITH CHECK ADD CHECK  (([pricegame]>(0)))
GO
USE [master]
GO
ALTER DATABASE [BOARDGAME] SET  READ_WRITE 
GO
