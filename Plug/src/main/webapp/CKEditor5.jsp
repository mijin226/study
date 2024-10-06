<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
import {
	ClassicEditor,		//기본에디터 클래스
	AccessibilityHelp,	//접근성 도움말 기능
	Alignment,			//정렬 기능
	Autoformat,			//자동 포맷 기능
	AutoLink,			//자동 링크 기능
	Autosave,			//자동 저장 기능
	BalloonToolbar,		//풍선 툴바 기능
	BlockQuote,			//인용 블록 기능
	Bold,				//굵기 기능
	Code,				//코드 블록 기능
	Essentials,			//기본 필수 기능
	FontBackgroundColor,//글자 배경 색상 기능
	FontColor,			//글자 색상 기능
	FontFamily,			//글꼴 종류 선택 기능
	FontSize,			//글자 크기 선택 기능
	FullPage,			//전체 페이지 모드 기능
	GeneralHtmlSupport,	//일반 HTML 지원 기능
	Heading,			//제목 기능
	HtmlComment,		//HTML 주석 기능
	HtmlEmbed,						//HTML 삽입 기능
	Indent,							//들여쓰기 기능
	IndentBlock,					//블록 들여쓰기 기능
	Italic,							//기울임 기능
	Link,							//링크 기능
	Paragraph,						//문단 기능
	SelectAll,						//모두 선택 기능
	ShowBlocks,						//블록 보기 기능
	SourceEditing,					//소스 편집 기능
	SpecialCharacters,				//특수 문자 기능
	SpecialCharactersArrows,		//특수문자 화살표 기능
	SpecialCharactersCurrency,		//특수문자 통화기호 기능
	SpecialCharactersEssentials,	//필수 특수문자 기능
	SpecialCharactersLatin,			//라틴문자 기능
	SpecialCharactersMathematical,	//수학적 특수 문자 기능
	SpecialCharactersText,			//텍스트 특수 문자 기능
	Strikethrough,					//취소선 기능
	Style,							//스타일 기능
	Subscript,						//아래 첨자 기능
	Superscript,					//위 첨자 기능
	Table,							//테이블 기능
	TableCaption,					//테이블 제목 기능
	TableCellProperties,			//테이블 셀속성 기능
	TableColumnResize,				//테이블 열크기조정 기능
	TableProperties,				//테이블 속성 기능
	TableToolbar,					//테이블 툴바 기능
	TextTransformation,				//텍스트 변환 기능
	Underline,						//밑줄 기능
	Undo							//실행 취소 기능
} from 'ckeditor5';					//필요한 기능 위 데이터 모두 가져오기

import translations from 'ckeditor5/translations/ko.js';	//한국어 번역하는 파일 가져오기

//CKEditor 설정하기 위한 객체
const editorConfig = {
	toolbar: {
		items: ['undo',	'redo', '|', 'sourceEditing', 'showBlocks',
			'|', 'heading', 'style', '|', 'fontSize', 'fontFamily',
			'fontColor', 'fontBackgroundColor', '|', 'bold',
			'italic', 'underline', 'strikethrough', 'subscript',
			'superscript', 'code', '|', 'specialCharacters',
			'link',	'insertTable', 'blockQuote', 'htmlEmbed', 
			'|', 'alignment', '|', 'outdent', 'indent'],
		shouldNotGroupWhenFull: false
	},
	plugins: [AccessibilityHelp, Alignment,	Autoformat,
		AutoLink, Autosave,	BalloonToolbar,	BlockQuote,
		Bold, Code,	Essentials,	FontBackgroundColor,
		FontColor, FontFamily, FontSize, FullPage,
		GeneralHtmlSupport,	Heading, HtmlComment,
		HtmlEmbed, Indent, IndentBlock,	Italic,	Link, 
		Paragraph, SelectAll, ShowBlocks, SourceEditing, 
		SpecialCharacters, SpecialCharactersArrows, 
		SpecialCharactersCurrency, SpecialCharactersEssentials, 
		SpecialCharactersLatin, SpecialCharactersMathematical, 
		SpecialCharactersText, Strikethrough, Style, Subscript, 
		Superscript, Table, TableCaption, TableCellProperties, 
		TableColumnResize, TableProperties, TableToolbar, 
		TextTransformation, Underline, Undo
	],
	balloonToolbar: ['bold', 'italic', '|', 'link'],
	fontFamily: {
		supportAllValues: true
	},
	fontSize: {
		options: [10, 12, 14, 'default', 18, 20, 22],
		supportAllValues: true
	},
	heading: {
		options: [
			{
				model: 'paragraph',
				title: 'Paragraph',
				class: 'ck-heading_paragraph'
			},
			{
				model: 'heading1',
				view: 'h1',
				title: 'Heading 1',
				class: 'ck-heading_heading1'
			},
			{
				model: 'heading2',
				view: 'h2',
				title: 'Heading 2',
				class: 'ck-heading_heading2'
			},
			{
				model: 'heading3',
				view: 'h3',
				title: 'Heading 3',
				class: 'ck-heading_heading3'
			},
			{
				model: 'heading4',
				view: 'h4',
				title: 'Heading 4',
				class: 'ck-heading_heading4'
			},
			{
				model: 'heading5',
				view: 'h5',
				title: 'Heading 5',
				class: 'ck-heading_heading5'
			},
			{
				model: 'heading6',
				view: 'h6',
				title: 'Heading 6',
				class: 'ck-heading_heading6'
			}
		]
	},
	htmlSupport: {
		allow: [
			{
				name: /^.*$/,
				styles: true,
				attributes: true,
				classes: true
			}
		]
	},
	initialData:
		'<h2>Congratulations on setting up CKEditor 5! 🎉</h2>\n<p>\n    You\'ve successfully created a CKEditor 5 project. This powerful text editor will enhance your application, enabling rich text editing\n    capabilities that are customizable and easy to use.\n</p>\n<h3>What\'s next?</h3>\n<ol>\n    <li>\n        <strong>Integrate into your app</strong>: time to bring the editing into your application. Take the code you created and add to your\n        application.\n    </li>\n    <li>\n        <strong>Explore features:</strong> Experiment with different plugins and toolbar options to discover what works best for your needs.\n    </li>\n    <li>\n        <strong>Customize your editor:</strong> Tailor the editor\'s configuration to match your application\'s style and requirements. Or even\n        write your plugin!\n    </li>\n</ol>\n<p>\n    Keep experimenting, and don\'t hesitate to push the boundaries of what you can achieve with CKEditor 5. Your feedback is invaluable to us\n    as we strive to improve and evolve. Happy editing!\n</p>\n<h3>Helpful resources</h3>\n<ul>\n    <li>📝 <a href="https://orders.ckeditor.com/trial/premium-features">Trial sign up</a>,</li>\n    <li>📕 <a href="https://ckeditor.com/docs/ckeditor5/latest/installation/index.html">Documentation</a>,</li>\n    <li>⭐️ <a href="https://github.com/ckeditor/ckeditor5">GitHub</a> (star us if you can!),</li>\n    <li>🏠 <a href="https://ckeditor.com">CKEditor Homepage</a>,</li>\n    <li>🧑‍💻 <a href="https://ckeditor.com/ckeditor-5/demo/">CKEditor 5 Demos</a>,</li>\n</ul>\n<h3>Need help?</h3>\n<p>\n    See this text, but the editor is not starting up? Check the browser\'s console for clues and guidance. It may be related to an incorrect\n    license key if you use premium features or another feature-related requirement. If you cannot make it work, file a GitHub issue, and we\n    will help as soon as possible!\n</p>\n',
	language: 'ko',
	link: {
		addTargetToExternalLinks: true,
		defaultProtocol: 'https://',
		decorators: {
			toggleDownloadable: {
				mode: 'manual',
				label: 'Downloadable',
				attributes: {
					download: 'file'
				}
			}
		}
	},
	placeholder: 'Type or paste your content here!',
	style: {
		definitions: [
			{
				name: 'Article category',
				element: 'h3',
				classes: ['category']
			},
			{
				name: 'Title',
				element: 'h2',
				classes: ['document-title']
			},
			{
				name: 'Subtitle',
				element: 'h3',
				classes: ['document-subtitle']
			},
			{
				name: 'Info box',
				element: 'p',
				classes: ['info-box']
			},
			{
				name: 'Side quote',
				element: 'blockquote',
				classes: ['side-quote']
			},
			{
				name: 'Marker',
				element: 'span',
				classes: ['marker']
			},
			{
				name: 'Spoiler',
				element: 'span',
				classes: ['spoiler']
			},
			{
				name: 'Code (dark)',
				element: 'pre',
				classes: ['fancy-code', 'fancy-code-dark']
			},
			{
				name: 'Code (bright)',
				element: 'pre',
				classes: ['fancy-code', 'fancy-code-bright']
			}
		]
	},
	table: {
		contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells', 'tableProperties', 'tableCellProperties']
	},
	translations: [translations]
};

ClassicEditor.create(document.querySelector('#editor'), editorConfig);

</script>
</body>
</html>