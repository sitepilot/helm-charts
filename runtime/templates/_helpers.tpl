{{- define "runtime.name" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "runtime.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "runtime.labels" -}}
helm.sh/chart: {{ include "runtime.chart" . }}
{{ include "runtime.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: "{{ .Values.image.tag | default .Chart.AppVersion }}"
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "runtime.selectorLabels" -}}
app.kubernetes.io/name: {{ include "runtime.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
