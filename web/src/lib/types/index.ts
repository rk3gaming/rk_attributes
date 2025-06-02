export interface Attributes {
    age: string;
    description: string;
}

export interface AttributesLocale {
    title: string;
    subtitle: string;
    age_label: string;
    age_placeholder: string;
    description_label: string;
    description_placeholder: string;
    description_hint: string;
    save_button: string;
}

export interface ExamineLocale {
    title: string;
    subtitle: string;
    age_label: string;
    description_label: string;
    close_button: string;
}

export interface SetVisibleData {
    visibility: boolean;
    attributes?: Attributes;
    locale?: AttributesLocale;
}

export interface SetExamineVisibleData {
    visibility: boolean;
    attributes?: Attributes;
    playerName?: string;
    locale?: ExamineLocale;
} 