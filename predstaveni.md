# Představení projektu

## Anotace

Adaptace na klimatickou změnu je v současnosti celospolečensky uznávanou
prioritou. K nesporným trendům přitom patří důraz na opatření
s potenciálem regulovat teplotní extrémy lokálního mikroklimatu
a snižování spotřeby pitné vody. K těmto opatřením patří
i zadržování srážkové vody, ať už v krajině nebo v umělých
akumulačních prostorech. Projekt SmartRainFlow cílí na oblast technické
akumulace srážkových vod (ASV) a jejich kvalitativního a kvantitativního
managementu. V rámci projektu budou vyvíjena technická a softwarová
řešení zvyšující kvalitu a kvantitu akumulované dešťové vody pro
2 objemové úrovně „chytrých“ nádrží (soukromé budovy a správní
budovy, velkoplošné komerční objekty). Vyvíjený senzorický/řídící
systém bude během řešení projektu testován na reálných systémech
ASV tak, aby jeho funkčnost byla prověřena během konkrétních
srážkových událostí. Systém bude mít složku senzoricko-monitorovací,
technologicko-regulační a prediktivně-interaktivní. Partner projektu
f. Waneka bude již během řešení projektu uvádět na trh vyvinuté
moduly pro systémy ASV. TUL bude vedle spoluúčasti na vývoji technických
řešení poskytovat široký analytický servis pro detailní monitoring
kvality akumulovaných srážkových vod, který bude nezbytný pro
vyhodnocení efektivity vyvíjených řešení.

### Hardware

Hardware celé jednotky bude vyvinut s co největším využitím
existujících populárních řešení. Pro hlavní řídící jednotku
je to například minipočítač Raspberry Pi, nebo jeho obdobu od jiného
výrobce. Pro moduly senzorů a řízení potom jednočipové počítače
standardu Arduino, který je vyvíjen v otevřené komunitě a existuje mnoho
výrobců, kteří tento standard podporují. Koncové senzory a řídící
prvky budeme také vybírat z těch nejlépe přístupných, nebo je budeme
experimentálně vyrábět.

### Software

Jeden z hlavních výstupů projektu je software, který bude použit pro
řídící a monitorovací funkce systému.

Na rozdíl od ostatních existujících projektů, které se zabývají
problémem řízení, je naším plánem vývoj tohoto systému na zelené
louce s využitím software s otevřeným zdrojovým kódem. Celé řešení
bude volně přístupné jak zákazníkům společnosti, tak široké
veřejnosti. Od tohoto kroku si slibujeme zvýšení viditelnosti projektu
a pomoc s vývojem od komunity, která jak doufáme kolem vývoje produktu
vznikne.

Software bude primárně pracovat offline, což jak doufáme povede nejen
k jeho větší jednoduchosti, ale hlavně bezpečnosti. Jakákoliv data
budou poskytována pouze se souhlasem majitele zařízení, přísně
omezeným exportem.

#### Operační systém

Jako operační systém hlavní řídící jednotky bude použita distribuce
operačního systému Alpine Linux. Tato distribuce, která původně vznikla
hlavně po potřeby konteinarizace v ekosystému Docker, se v průběhu
času vyprofilovala jako vhodná pro potřeby v podobných projektech. Jako
hlavní výhody tohoto řešení vidíme v její jednoduchosti, spolehlivosti
a velkém množství dokumentace.

#### Řídící software

Celý řídící systém bude vyvinut v novém slibně vyvíjejícím se
programovacím jazyce Janet. Tento jazyk se nám zdá jako velmi vhodný
pro řešení podobných problémů. Jeho implementace je zároveň jednoduchá
a pochopitelná a přeci velmi výkonná. Další velkou výhodou je
přímočaré spojení s kódem napsaným v programovacím jazyce C, který
je stále nejpoužívanější pro programování embedded systémů, jako
bude náš výsledný systém.

Vyvinut v tomto jazyce bude nejen vlastní monitorovací a řídící systém,
ale také veškeré nástroje pro kontiuální vývoj a nasazení a vlastní
webové interface pro kontrolu a ovládání řídící jednotky.

### Umělá inteligence

Součástí řídící jednotky bude vrstva, která bude zajišťovat analýzu
dat pomocí deep learning. Tato analýza bude prováděna nejen nad daty
sebranými v samotném zařízení, ale také v korelaci s ostatními vonlně
přístupnými daty od třetích stran, jako jsou předpovědi počasí a
prognózy srážkových úhrnů. Výstupy analýzy budou využity jak pro řízení
celého systému, tak pro obecný vývoj HW a SW u zákazníků, kteří se rozhodnou
přispívat tato do centrálního výzkumného korpusu dat.

### Projektování

Pro potřeby tvorby technických projektů během vývoje bude v projektu
použita aplikace OpenScad, která je vyvíjena s otevřenými zdroji a
narozdíl od obvyklého způsobu tří rozměrného modelování využívá
deklarativní parametrické programování. Tento způsob, pokud je dobře
zvládnut, nabízí mnohem větší flexibilitu během vývoje, protože je
možné drobnými změnami parametrů dosáhnout velmi rychle zásadních změn
funkčnosti. Tento postup bude také velkou výhodou při podpoře prodeje,
protože dovolí zákazníkům vytvířet jednoduše a automatizovaně návrh
šitý přesně na míru jejich potřebám.

### 3D tisk

Máme v plánu co nejvíc dílů navrhnout tak abychom byli schopni si je
sami vyrábět s pomocí 3D tisku. Tím nebudeme závislí na dodávkách
často ze zahraničí a také budeme schopni zajistit větší flexibilitu
návrhu. Všechny modely budou také navrženy v aplikaci OpenScad a budou
součástí software publikovaném s otevřenými zdroji.
